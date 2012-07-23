--- 
categories: 
  - Webkit
comments: true
layout: post
published: true
status: publish
tags: 
  - WebKit
title: WebKit 网页装载流程
type: post
---
{% codeblock %}


[code]
FrameLoader.cpp
2048: RefPtr&lt;DocumentLoader&gt; loader = m_client-&gt;createDocumentLoader(request, substituteData);
2051: load(loader.get());
2083: void FrameLoader::load(DocumentLoader* newDocumentLoader)
(
2085: ResourceRequest&amp; r = newDocumentLoader-&gt;request();
2086: addExtraFcd ieldsToMainResourceRequest(r);
)
2110: loadWithDocumentLoader(newDocumentLoader, type, 0);
2013: void FrameLoader::loadWithDocumentLoader(DocumentLoader* loader, FrameLoadType type, PassRefPtr&lt;FormState&gt; prpFormState)
2130~2156: policyChecker()-&gt;checkNavigationPolicy()
3533: void FrameLoader::continueLoadAfterNavigationPolicy(const ResourceRequest&amp;, PassRefPtr&lt;FormState&gt; formState, bool shouldContinue)
3596~3599:
if (formState)
m_client-&gt;dispatchWillSubmitForm(&amp;PolicyChecker::continueLoadAfterWillSubmitForm, formState);
else
continueLoadAfterWillSubmitForm();
3093: void FrameLoader::continueLoadAfterWillSubmitForm()
3119: if (!m_provisionalDocumentLoader-&gt;startLoadingMainResource(identifier))
DocumentLoader.cpp
717: bool DocumentLoader::startLoadingMainResource(unsigned long identifier)
720: m_mainResourceLoader = MainResourceLoader::create(m_frame);
727: if (!m_mainResourceLoader-&gt;load(m_request, m_substituteData)) {
MainResourceLoader.cpp
525: bool MainResourceLoader::load(const ResourceRequest&amp; r, const SubstituteData&amp; substituteData)
544: if (loadNow(request)) {
492: bool MainResourceLoader::loadNow(ResourceRequest&amp; r)
520: m_handle = ResourceHandle::create(r, this, m_frame.get(), false, true);
ResourceHandle.cpp (locate at WebCore/platform/network)
46: PassRefPtr&lt;ResourceHandle&gt; ResourceHandle::create(const ResourceRequest&amp; request, ResourceHandleClient* client, Frame* frame, bool defersLoading, bool shouldContentSniff)
64: if (newHandle-&gt;start(frame))
(the start function depends on platform, take QT as example)
ResourceHandleQt.cpp
119: bool ResourceHandle::start(Frame* frame)
141: d-&gt;m_job = new QNetworkReplyHandler(this, QNetworkReplyHandler::LoadMode(d-&gt;m_defersLoading));
QtNetworkReplyHandler.cpp
130: QNetworkReplyHandler::QNetworkReplyHandler(ResourceHandle* handle, LoadMode loadMode)
168: start();
414: void QNetworkReplyHandler::start()
(
420: QNetworkAccessManager* manager = d-&gt;m_frame-&gt;page()-&gt;networkAccessManager();
433: m_reply = manager-&gt;get(m_request);
437: m_reply = manager-&gt;post(m_request, postDevice);
476: connect(m_reply, SIGNAL(finished()), this, SLOT(finish()), SIGNAL_CONN);
-&gt;229: void QNetworkReplyHandler::finish()
--&gt;252: client-&gt;didFinishLoading(m_resourceHandle);
485: connect(m_reply, SIGNAL(readyRead()), this, SLOT(forwardData()), SIGNAL_CONN);
-&gt;357: void QNetworkReplyHandler::forwardData()
--&gt;398: client-&gt;didReceiveData(m_resourceHandle, data.constData(), data.length(), data.length() /*FixMe*/);
489: connect(m_reply, SIGNAL(uploadProgress(qint64, qint64)), this, SLOT(uploadProgress(qint64, qint64)), SIGNAL_CONN);
-&gt;402: void QNetworkReplyHandler::uploadProgress(qint64 bytesSent, qint64 bytesTotal)
--&gt;411: client-&gt;didSendData(m_resourceHandle, bytesSent, bytesTotal);
484: connect(this, SIGNAL(processQueuedItems()), this, SLOT(sendQueuedItems()), SIGNAL_CONN);
-&gt;509: void QNetworkReplyHandler::sendQueuedItems()
)
(Qt implements ResourceHandleClient for class WebCoreSynchronousLoader in ResourcehandleQt.cpp)
restart from 398: client-&gt;didReceiveData(m_resourceHandle, data.constData(), data.length(), data.length() /*FixMe*/);
ResourceLoader.cpp
248: void ResourceLoader::didReceiveData(const char* data, int length, long long lengthReceived, bool allAtOnce)
260: addData(data, length, allAtOnce);
MainResourceLoader.cpp
143: void MainResourceLoader::addData(const char* data, int length, bool allAtOnce)
146: frameLoader()-&gt;receivedData(data, length);
FrameLoader.cpp
2174: void FrameLoader::receivedData(const char* data, int length)
2176: activeDocumentLoader()-&gt;receivedData(data, length);
DocumentLoader.cpp
288: void DocumentLoader::receivedData(const char* data, int length)
292: commitLoad(data, length);
272: void DocumentLoader::commitLoad(const char* data, int length)
280: frameLoader-&gt;committedLoad(this, data, length);
FrameLoader.cpp
3350: void FrameLoader::committedLoad(DocumentLoader* loader, const char* data, int length)
(depend on platform, take Qt as example)
FrameLoaderClientQt.cpp
741: void FrameLoaderClientQt::committedLoad(WebCore::DocumentLoader* loader, const char* data, int length)
751: fl-&gt;addData(data, length);
FrameLoader.cpp
1544: void FrameLoader::addData(const char* bytes, int length)
1549: write(bytes, length);
889: void FrameLoader::write(const char* str, int len, bool flush)
949: tokenizer-&gt;write(decoded, true);
HTMLTokenizer.cpp
1624: void HTMLTokenizer::write(const SegmentedString&amp; str, bool appendData)
1633~1648: try to execute script
1684: while (!m_src.isEmpty() &amp;&amp; (!frame || !frame-&gt;redirectScheduler()-&gt;locationChangePending())) {
(
1760: processToken();
1913: PassRefPtr&lt;Node&gt; HTMLTokenizer::processToken()
1941: n = m_parser-&gt;parseToken(&amp;m_currentToken);
HTMLParser.cpp
230: PassRefPtr&lt;Node&gt; HTMLParser::parseToken(Token* t)
224: inline bool HTMLParser::insertNodeAfterLimitBlockDepth(Node* n, bool flat)
352: bool HTMLParser::insertNode(Node* n, bool flat)
n-&gt;attach();
404: m_document-&gt;frame()-&gt;loader()-&gt;dispatchDocumentElementAvailable();
)
FrameLoader.cpp
3985: void FrameLoader::dispatchDocumentElementAvailable()
3987: m_frame-&gt;injectUserScripts(InjectAtDocumentStart); (script!!)
3988: m_client-&gt;documentElementAvailable(); (depend on platform)
[/code]

{% endcodeblock %}
