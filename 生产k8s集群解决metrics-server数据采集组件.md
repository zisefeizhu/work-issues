恢复前
可以看到无法监测节点的监控数据，查看组件metrics-server。
# kubectl get pods -n kube-system
NAME                                               READY   STATUS             RESTARTS   AGE       
metrics-server-6bc4dcc6bd-2tscf                    1/1     Running            0          337d
组建状态还好。看看日志
# kubectl logs -f metrics-server-6bc4dcc6bd-2tscf -n kube-system
I0912 02:28:40.787145       1 heapster.go:77] /metrics-server --source=kubernetes:https://kubernetes.default --sink=socket:tcp://monitor.csk.cn-shenzhen.aliyuncs.com:8093?clusterId=c02e82b6adaf044bd94d251fea1279648&public=true
I0912 02:28:40.787284       1 heapster.go:78] Metrics Server version v0.2.1
I0912 02:28:40.787609       1 configs.go:61] Using Kubernetes client with master "https://kubernetes.default" and version
I0912 02:28:40.787637       1 configs.go:62] Using kubelet port 10255
I0912 02:28:40.817219       1 heapster.go:146] Starting with Socket Sink
I0912 02:28:40.817248       1 heapster.go:146] Starting with Metric Sink
I0912 02:28:40.825688       1 heapster.go:118] Starting heapster on port 8082
I0912 02:28:41.098305       1 serving.go:308] Generated self-signed cert (apiserver.local.config/certificates/apiserver.crt, apiserver.local.config/certificates/apiserver.key)
I0912 02:28:41.253732       1 heapster.go:108] Starting Heapster API server...
[restful] 2020/09/12 02:28:41 log.go:33: [restful/swagger] listing is available at https:///swaggerapi
[restful] 2020/09/12 02:28:41 log.go:33: [restful/swagger] https:///swaggerui/ is mapped to folder /swagger-ui/
I0912 02:28:41.268265       1 serve.go:85] Serving securely on 0.0.0.0:443
I0912 02:29:00.716380       1 reststorage.go:93] No metrics for pod production-project/project-frame-7d6b4bffc5-c5rvn
I0912 02:29:00.716415       1 reststorage.go:93] No metrics for pod production-project/honda-avancier360-web-6ccd9cdcd7-6n8f8
I0912 02:29:00.716424       1 reststorage.go:93] No metrics for pod production-project/dongfeng-venucia-web-7fbc4f9949-k5stl
I0912 02:29:00.716429       1 reststorage.go:93] No metrics for pod test/test-ci-5568fbc9bc-lxpt7
I0912 02:29:00.716435       1 reststorage.go:93] No metrics for pod production/websocket-85fb8b49fd-bvm5m
I0912 02:29:00.716440       1 reststorage.go:93] No metrics for pod production/realibox-open-cloud-bc4c9d5d-7jv4z
I0912 02:29:00.716446       1 reststorage.go:93] No metrics for pod production/ui-design-editor-web-85cfd87c6f-8d86q
I0912 02:29:00.716451       1 reststorage.go:93] No metrics for pod kube-system/kube-flannel-ds-zbfkc
I0912 02:29:00.716456       1 reststorage.go:93] No metrics for pod kube-system/kube-proxy-worker-l597t
I0912 02:29:00.716461       1 reststorage.go:93] No metrics for pod cattle-system/cattle-node-agent-hbzl6
I0912 02:29:00.716467       1 reststorage.go:93] No metrics for pod production/paas-ws-68b57df74-9rj6p
I0912 02:29:00.716474       1 reststorage.go:93] No metrics for pod kube-system/kube-flannel-ds-wwld7
I0912 02:29:00.716479       1 reststorage.go:93] No metrics for pod default/sentry-v1-sentry-redis-slave-1
I0912 02:29:00.716485       1 reststorage.go:93] No metrics for pod kube-system/flexvolume-8rdnl
I0912 02:29:00.716491       1 reststorage.go:93] No metrics for pod production/help-docs-5c99c6d8d9-xm5gv
I0912 02:29:00.716497       1 reststorage.go:93] No metrics for pod stage/realibox-account-sso-796756cdf-62fnm
I0912 02:29:00.716517       1 reststorage.go:93] No metrics for pod kube-system/kube-proxy-worker-dr6j4
I0912 02:29:00.716523       1 reststorage.go:93] No metrics for pod production/realibox-cms-b6fdc8fdf-f2d46
I0912 02:29:00.716529       1 reststorage.go:93] No metrics for pod kube-system/nginx-ingress-controller-584cd5888f-djhjq
I0912 02:29:00.716535       1 reststorage.go:93] No metrics for pod kube-system/kube-flannel-ds-2s89d
I0912 02:29:00.716543       1 reststorage.go:93] No metrics for pod default/private-reg
I0912 02:29:00.716549       1 reststorage.go:93] No metrics for pod kube-system/kube-proxy-worker-njnzs
I0912 02:29:00.716557       1 reststorage.go:93] No metrics for pod kube-system/aliyun-acr-credential-helper-757974fd9b-vgd78
I0912 02:29:00.716563       1 reststorage.go:93] No metrics for pod stage-project/fit360-web-75dd99dbb4-78srq
I0912 02:29:00.716569       1 reststorage.go:93] No metrics for pod stage-project/honda-breeze360-web-78dfc6df56-8b2bm
I0912 02:29:00.716575       1 reststorage.go:93] No metrics for pod cert-manager/cert-manager-84fc69dbdf-hp9m7
I0912 02:29:00.716583       1 reststorage.go:93] No metrics for pod cattle-system/cattle-node-agent-xk9pn
I0912 02:29:00.716589       1 reststorage.go:93] No metrics for pod loging/fluentd-es-46jzc
I0912 02:29:00.716594       1 reststorage.go:93] No metrics for pod kube-system/flexvolume-5fw55
I0912 02:29:00.716631       1 reststorage.go:93] No metrics for pod kube-system/logtail-ds-9zggv
I0912 02:29:00.716638       1 reststorage.go:93] No metrics for pod stage-project/fit360-web-75dd99dbb4-jtwzp
I0912 02:29:00.716643       1 reststorage.go:93] No metrics for pod production/vivo-s7-web-7988646999-gvsng
I0912 02:29:00.716664       1 reststorage.go:93] No metrics for pod cert-manager/cert-manager-webhook-alidns-d5b8d5f9d-cgspg
I0912 02:29:00.716671       1 reststorage.go:93] No metrics for pod production/realibox-admin-web-66bbb86fd7-dgl2w
I0912 02:29:00.716677       1 reststorage.go:93] No metrics for pod production/tutorial-77487596c-mplk6
I0912 02:29:00.716683       1 reststorage.go:93] No metrics for pod production/studio-socket-server-67854dffbf-m9khr
I0912 02:29:00.716688       1 reststorage.go:93] No metrics for pod cert-manager/cert-manager-cainjector-869bb969f6-vlktk
I0912 02:29:00.716693       1 reststorage.go:93] No metrics for pod kube-system/alicloud-application-controller-6858d789b7-j6vz8
I0912 02:29:00.716699       1 reststorage.go:93] No metrics for pod production/realibox-open-admin-web-5b864bcb46-8npgh
I0912 02:29:00.716704       1 reststorage.go:93] No metrics for pod kube-system/cluster-autoscaler-5cbd7bb484-ppfdn
I0912 02:29:00.716710       1 reststorage.go:93] No metrics for pod stage/realibox-open-admin-web-c4798f9dc-2lqls
I0912 02:29:00.716716       1 reststorage.go:93] No metrics for pod default/gitlab-gitaly-0
I0912 02:29:00.716722       1 reststorage.go:93] No metrics for pod production-project/honda-breeze360-web-6db667f64f-5bwjs
I0912 02:29:00.716728       1 reststorage.go:93] No metrics for pod stage/realibox-cms-675c566b5d-t5trx
I0912 02:29:00.716733       1 reststorage.go:93] No metrics for pod cattle-system/cattle-node-agent-sk9zc
I0912 02:29:00.716739       1 reststorage.go:93] No metrics for pod production-project/honda-fit360-web-6c99d4f89-dtjxh
I0912 02:29:00.716745       1 reststorage.go:93] No metrics for pod production/realibox-account-sso-5f8c8668d9-9nl7b
I0912 02:29:00.716751       1 reststorage.go:93] No metrics for pod stage-project/honda-fit360-web-6977674bb4-w8d97
I0912 02:29:00.716756       1 reststorage.go:93] No metrics for pod stage-project/project-frame-6d7777bbbd-lzl26
I0912 02:29:00.716761       1 reststorage.go:93] No metrics for pod kube-system/coredns-66dfb6457b-575d8
I0912 02:29:00.716766       1 reststorage.go:93] No metrics for pod production-project/project-frame-7d6b4bffc5-4qjx7
I0912 02:29:00.716771       1 reststorage.go:93] No metrics for pod kube-system/tiller-deploy-747996788d-djj8q
I0912 02:29:00.716776       1 reststorage.go:93] No metrics for pod kube-system/alicloud-disk-controller-75bd74c84f-drfj2
I0912 02:29:00.716780       1 reststorage.go:93] No metrics for pod production/realibox-studio-editor-59879f6685-9sdrl
I0912 02:29:00.716786       1 reststorage.go:93] No metrics for pod production/realibox-official-website-85ccb8d4d8-ncn7k
I0912 02:29:00.716792       1 reststorage.go:93] No metrics for pod loging/fluentd-es-brlg7
I0912 02:29:00.716798       1 reststorage.go:93] No metrics for pod stage/studio-socket-server-56969d4b6d-wmnsd
I0912 02:29:00.716804       1 reststorage.go:93] No metrics for pod stage-project/honda-avancier360-web-75cbf47fdb-pk6sk
I0912 02:29:00.716809       1 reststorage.go:93] No metrics for pod cattle-system/cattle-cluster-agent-57b9855459-rz55g
I0912 02:29:00.716815       1 reststorage.go:93] No metrics for pod stage/realibox-new-studio-editor-7cd75b8bb4-8nzdc
I0912 02:29:00.716820       1 reststorage.go:93] No metrics for pod stage-studio/vivo-s7-web-6b7d6684c8-4qbth
I0912 02:29:00.716826       1 reststorage.go:93] No metrics for pod gitlab-runner/gitlab-runner-gitlab-runner-855ddf55c9-rxwrd
I0912 02:29:00.716831       1 reststorage.go:93] No metrics for pod cert-manager/cert-manager-webhook-7b4fb887bc-8mlvk
I0912 02:29:00.716842       1 reststorage.go:93] No metrics for pod production-dicastal/paas-ws-7b45958bd5-mq9l5
I0912 02:29:00.716849       1 reststorage.go:93] No metrics for pod production-project/venucia-web-5b45dff889-wldph
I0912 02:29:00.716854       1 reststorage.go:93] No metrics for pod production/tutorial-77487596c-rfl7k
I0912 02:29:00.716860       1 reststorage.go:93] No metrics for pod stage/paas-ws-5d59879d57-qkrd6
I0912 02:29:00.716866       1 reststorage.go:93] No metrics for pod kube-system/logtail-ds-m2ccf
I0912 02:29:00.716871       1 reststorage.go:93] No metrics for pod production/realibox-cms-b6fdc8fdf-29fkp
I0912 02:29:00.716884       1 reststorage.go:93] No metrics for pod cattle-system/cattle-node-agent-9zb2t
I0912 02:29:00.716889       1 reststorage.go:93] No metrics for pod production/realibox-open-admin-web-5b864bcb46-nlx6j
I0912 02:29:00.716895       1 reststorage.go:93] No metrics for pod production/paas-ws-68b57df74-4qdpr
I0912 02:29:00.716901       1 reststorage.go:93] No metrics for pod kube-system/kube-flannel-ds-52l8v
I0912 02:29:00.716909       1 reststorage.go:93] No metrics for pod default/sentry-v1-sentry-redis-slave-0
I0912 02:29:00.716915       1 reststorage.go:93] No metrics for pod stage-project/project-frame-6d7777bbbd-r229d
I0912 02:29:00.716920       1 reststorage.go:93] No metrics for pod stage/realibox-official-website-bfd9897c-5df5g
I0912 02:29:00.716937       1 reststorage.go:93] No metrics for pod kube-system/alicloud-nas-controller-7b6678f956-5gc2q
I0912 02:29:00.716946       1 reststorage.go:93] No metrics for pod kube-system/kube-proxy-worker-6mt2m
I0912 02:29:00.716952       1 reststorage.go:93] No metrics for pod production/realibox-admin-web-66bbb86fd7-2prcl
I0912 02:29:00.716958       1 reststorage.go:93] No metrics for pod stage/realibox-open-cloud-54f44b8946-5hptb
I0912 02:29:00.716966       1 reststorage.go:93] No metrics for pod stage-project/venucia-web-7f498f94b5-zqq2h
I0912 02:29:00.716972       1 reststorage.go:93] No metrics for pod kube-system/flexvolume-zjm67
I0912 02:29:00.716977       1 reststorage.go:93] No metrics for pod kube-system/flexvolume-f8thl
I0912 02:29:00.716983       1 reststorage.go:93] No metrics for pod kube-system/logtail-ds-sqsg9
I0912 02:29:00.716988       1 reststorage.go:93] No metrics for pod production/realibox-official-website-85ccb8d4d8-7g8rg
I0912 02:29:00.716993       1 reststorage.go:93] No metrics for pod kube-system/nginx-ingress-controller-584cd5888f-ngshm
I0912 02:29:00.717000       1 reststorage.go:93] No metrics for pod production/ui-design-editor-web-85cfd87c6f-wfg67
I0912 02:29:00.717005       1 reststorage.go:93] No metrics for pod kube-system/nginx-ingress-controller-584cd5888f-2qf5v
I0912 02:29:00.717011       1 reststorage.go:93] No metrics for pod kube-system/logtail-ds-zjxf7
I0912 02:29:00.717016       1 reststorage.go:93] No metrics for pod production/official-website-web-76c9bcc48b-7wft2
I0912 02:29:00.717022       1 reststorage.go:93] No metrics for pod kube-system/alicloud-monitor-controller-9d8c87b9c-vbc5z
I0912 02:29:00.717027       1 reststorage.go:93] No metrics for pod kube-system/coredns-66dfb6457b-q7tt8
I0912 02:29:00.717033       1 reststorage.go:93] No metrics for pod stage-project/venucia-web-7f498f94b5-tgxlj
I0912 02:29:00.717039       1 reststorage.go:93] No metrics for pod businesscard/businesscard-deployment-7dd845df6c-dfhhs
I0912 02:29:00.717044       1 reststorage.go:93] No metrics for pod stage/realibox-admin-web-645d6d4b45-k7gx7
I0912 02:29:00.717050       1 reststorage.go:93] No metrics for pod kube-system/metrics-server-6bc4dcc6bd-2tscf
I0912 02:29:00.717056       1 reststorage.go:93] No metrics for pod production-project/honda-breeze360-web-6db667f64f-ph85v
I0912 02:29:00.717063       1 reststorage.go:93] No metrics for pod kube-system/kubed-kubed-84d4498ffb-9slmk
I0912 02:29:00.717069       1 reststorage.go:93] No metrics for pod production/realibox-studio-editor-59879f6685-dg9ps
I0912 02:29:00.717074       1 reststorage.go:93] No metrics for pod production-project/honda-fit360-web-6c99d4f89-mpzlv
I0912 02:29:00.717080       1 reststorage.go:93] No metrics for pod production-project/venucia-web-5b45dff889-cfkx7
I0912 02:29:00.717086       1 reststorage.go:93] No metrics for pod kube-system/drain-node
I0912 02:29:00.717091       1 reststorage.go:93] No metrics for pod stage-studio/realibox-ui-editor-6c4c8757f9-6xqnj
I0912 02:29:00.717097       1 reststorage.go:93] No metrics for pod kube-system/alibaba-log-controller-5477dbdc5c-xcp9j
I0912 02:29:00.717102       1 reststorage.go:93] No metrics for pod production-project/honda-avancier360-web-6ccd9cdcd7-6nwz9
I0912 02:29:00.717108       1 reststorage.go:93] No metrics for pod stage/studio-editor-web-6f975f84cd-mgjb2
I0912 02:29:00.717113       1 reststorage.go:93] No metrics for pod production/websocket-85fb8b49fd-wj85x
I0912 02:29:00.717119       1 reststorage.go:93] No metrics for pod stage/studio-editor-web-6f975f84cd-jd8q8
I0912 02:29:00.717125       1 reststorage.go:93] No metrics for pod kube-system/nginx-ingress-controller-584cd5888f-gpzf9
I0912 02:29:00.717131       1 reststorage.go:93] No metrics for pod stage-project/dongfeng-venucia-web-5455895459-9pzpz
I0912 02:29:00.717137       1 reststorage.go:93] No metrics for pod gitlab-runner/gitlab-runner-gitlab-runner-855ddf55c9-c96hx
I0912 02:29:00.717142       1 reststorage.go:93] No metrics for pod production/official-website-web-76c9bcc48b-5smrl
I0912 02:29:00.717149       1 reststorage.go:93] No metrics for pod default/sentry-v1-sentry-redis-master-0
I0912 02:29:00.717154       1 reststorage.go:93] No metrics for pod production-project/dongfeng-venucia-web-7fbc4f9949-lk9rz
I0912 02:29:05.185530       1 socket.go:38] Start ExportData 571 metrics.
I0912 02:29:05.219102       1 socket.go:172] Successful write 188036 bytes metrics to monitor server
I0912 02:29:05.422069       1 socket.go:172] Successful write 178902 bytes metrics to monitor server
I0912 02:29:05.625165       1 socket.go:172] Successful write 176925 bytes metrics to monitor server
I0912 02:29:05.829881       1 socket.go:172] Successful write 175163 bytes metrics to monitor server
I0912 02:29:06.032404       1 socket.go:172] Successful write 164342 bytes metrics to monitor server
I0912 02:29:06.235228       1 socket.go:172] Successful write 167505 bytes metrics to monitor server
I0912 02:29:06.437541       1 socket.go:172] Successful write 168063 bytes metrics to monitor server
I0912 02:29:06.639957       1 socket.go:172] Successful write 166491 bytes metrics to monitor server
I0912 02:29:06.842272       1 socket.go:172] Successful write 173985 bytes metrics to monitor server
I0912 02:29:07.044539       1 socket.go:172] Successful write 165635 bytes metrics to monitor server
I0912 02:29:07.247036       1 socket.go:172] Successful write 165497 bytes metrics to monitor server
I0912 02:29:07.450301       1 socket.go:172] Successful write 177415 bytes metrics to monitor server
I0912 02:29:07.655123       1 socket.go:172] Successful write 181230 bytes metrics to monitor server
I0912 02:29:07.857470       1 socket.go:172] Successful write 172878 bytes metrics to monitor server
I0912 02:29:08.060227       1 socket.go:172] Successful write 178871 bytes metrics to monitor server
I0912 02:29:08.262619       1 socket.go:172] Successful write 178953 bytes metrics to monitor server
I0912 02:29:08.464968       1 socket.go:172] Successful write 170861 bytes metrics to monitor server
I0912 02:29:08.669494       1 socket.go:172] Successful write 183003 bytes metrics to monitor server
I0912 02:29:08.872217       1 socket.go:172] Successful write 171898 bytes metrics to monitor server
I0912 02:29:09.074816       1 socket.go:172] Successful write 184579 bytes metrics to monitor server
I0912 02:29:09.277516       1 socket.go:172] Successful write 176897 bytes metrics to monitor server
I0912 02:29:09.480377       1 socket.go:172] Successful write 175535 bytes metrics to monitor server
I0912 02:29:09.683284       1 socket.go:172] Successful write 181518 bytes metrics to monitor server
I0912 02:29:09.884186       1 socket.go:172] Successful write 34615 bytes metrics to monitor server
I0912 02:30:02.396664       1 reststorage.go:93] No metrics for pod kube-system/coredns-66dfb6457b-q7tt8
I0912 02:30:02.396693       1 reststorage.go:93] No metrics for pod stage-project/venucia-web-7f498f94b5-tgxlj
I0912 02:30:02.396703       1 reststorage.go:93] No metrics for pod businesscard/businesscard-deployment-7dd845df6c-dfhhs
I0912 02:30:02.396711       1 reststorage.go:93] No metrics for pod stage/realibox-admin-web-645d6d4b45-k7gx7
I0912 02:30:02.396718       1 reststorage.go:93] No metrics for pod kube-system/metrics-server-6bc4dcc6bd-2tscf
I0912 02:30:02.396724       1 reststorage.go:93] No metrics for pod production-project/honda-breeze360-web-6db667f64f-ph85v
I0912 02:30:02.396733       1 reststorage.go:93] No metrics for pod kube-system/kubed-kubed-84d4498ffb-9slmk
I0912 02:30:02.396740       1 reststorage.go:93] No metrics for pod production/realibox-studio-editor-59879f6685-dg9ps
I0912 02:30:02.396747       1 reststorage.go:93] No metrics for pod production-project/honda-fit360-web-6c99d4f89-mpzlv
I0912 02:30:02.396757       1 reststorage.go:93] No metrics for pod production-project/venucia-web-5b45dff889-cfkx7
I0912 02:30:02.396767       1 reststorage.go:140] No metrics for container drain-node in pod kube-system/drain-node
I0912 02:30:02.396779       1 reststorage.go:93] No metrics for pod kube-system/drain-node
I0912 02:30:02.396788       1 reststorage.go:93] No metrics for pod stage-studio/realibox-ui-editor-6c4c8757f9-6xqnj
I0912 02:30:02.396803       1 reststorage.go:93] No metrics for pod kube-system/alibaba-log-controller-5477dbdc5c-xcp9j
I0912 02:30:02.396813       1 reststorage.go:93] No metrics for pod production-project/honda-avancier360-web-6ccd9cdcd7-6nwz9
I0912 02:30:02.396832       1 reststorage.go:93] No metrics for pod stage/studio-editor-web-6f975f84cd-mgjb2
I0912 02:30:02.396842       1 reststorage.go:93] No metrics for pod production/websocket-85fb8b49fd-wj85x
I0912 02:30:02.396860       1 reststorage.go:93] No metrics for pod stage/studio-editor-web-6f975f84cd-jd8q8
I0912 02:30:02.396873       1 reststorage.go:93] No metrics for pod kube-system/nginx-ingress-controller-584cd5888f-gpzf9
I0912 02:30:02.396892       1 reststorage.go:93] No metrics for pod stage-project/dongfeng-venucia-web-5455895459-9pzpz
I0912 02:30:02.396903       1 reststorage.go:93] No metrics for pod gitlab-runner/gitlab-runner-gitlab-runner-855ddf55c9-c96hx
I0912 02:30:02.396912       1 reststorage.go:93] No metrics for pod production/official-website-web-76c9bcc48b-5smrl
I0912 02:30:02.396922       1 reststorage.go:93] No metrics for pod default/sentry-v1-sentry-redis-master-0
I0912 02:30:02.396940       1 reststorage.go:93] No metrics for pod production-project/dongfeng-venucia-web-7fbc4f9949-lk9rz
I0912 02:30:02.396950       1 reststorage.go:93] No metrics for pod production-project/project-frame-7d6b4bffc5-c5rvn
I0912 02:30:02.396969       1 reststorage.go:93] No metrics for pod production-project/honda-avancier360-web-6ccd9cdcd7-6n8f8
I0912 02:30:02.396981       1 reststorage.go:93] No metrics for pod production-project/dongfeng-venucia-web-7fbc4f9949-k5stl
I0912 02:30:02.396993       1 reststorage.go:93] No metrics for pod test/test-ci-5568fbc9bc-lxpt7
I0912 02:30:02.397011       1 reststorage.go:93] No metrics for pod production/websocket-85fb8b49fd-bvm5m
I0912 02:30:02.397024       1 reststorage.go:93] No metrics for pod production/realibox-open-cloud-bc4c9d5d-7jv4z
I0912 02:30:02.397043       1 reststorage.go:93] No metrics for pod production/ui-design-editor-web-85cfd87c6f-8d86q
I0912 02:30:02.397054       1 reststorage.go:93] No metrics for pod kube-system/kube-flannel-ds-zbfkc
I0912 02:30:02.397073       1 reststorage.go:93] No metrics for pod kube-system/kube-proxy-worker-l597t
I0912 02:30:02.397083       1 reststorage.go:93] No metrics for pod cattle-system/cattle-node-agent-hbzl6
I0912 02:30:02.397092       1 reststorage.go:93] No metrics for pod production/paas-ws-68b57df74-9rj6p
I0912 02:30:02.397109       1 reststorage.go:93] No metrics for pod kube-system/kube-flannel-ds-wwld7
I0912 02:30:02.397128       1 reststorage.go:93] No metrics for pod default/sentry-v1-sentry-redis-slave-1
I0912 02:30:02.397142       1 reststorage.go:93] No metrics for pod kube-system/flexvolume-8rdnl
I0912 02:30:02.397162       1 reststorage.go:93] No metrics for pod production/help-docs-5c99c6d8d9-xm5gv
I0912 02:30:02.397173       1 reststorage.go:93] No metrics for pod stage/realibox-account-sso-796756cdf-62fnm
I0912 02:30:02.397185       1 reststorage.go:93] No metrics for pod kube-system/kube-proxy-worker-dr6j4
I0912 02:30:02.397224       1 reststorage.go:93] No metrics for pod production/realibox-cms-b6fdc8fdf-f2d46
I0912 02:30:02.397236       1 reststorage.go:93] No metrics for pod kube-system/nginx-ingress-controller-584cd5888f-djhjq
I0912 02:30:02.397246       1 reststorage.go:93] No metrics for pod kube-system/kube-flannel-ds-2s89d
I0912 02:30:02.397269       1 reststorage.go:93] No metrics for pod default/private-reg
I0912 02:30:02.397279       1 reststorage.go:93] No metrics for pod kube-system/kube-proxy-worker-njnzs
I0912 02:30:02.397298       1 reststorage.go:93] No metrics for pod kube-system/aliyun-acr-credential-helper-757974fd9b-vgd78
I0912 02:30:02.397308       1 reststorage.go:93] No metrics for pod stage-project/fit360-web-75dd99dbb4-78srq
I0912 02:30:02.397327       1 reststorage.go:93] No metrics for pod stage-project/honda-breeze360-web-78dfc6df56-8b2bm
I0912 02:30:02.397339       1 reststorage.go:93] No metrics for pod cert-manager/cert-manager-84fc69dbdf-hp9m7
I0912 02:30:02.397364       1 reststorage.go:93] No metrics for pod cattle-system/cattle-node-agent-xk9pn
I0912 02:30:02.397377       1 reststorage.go:93] No metrics for pod loging/fluentd-es-46jzc
I0912 02:30:02.397395       1 reststorage.go:93] No metrics for pod kube-system/flexvolume-5fw55
I0912 02:30:02.397408       1 reststorage.go:93] No metrics for pod kube-system/logtail-ds-9zggv
I0912 02:30:02.397418       1 reststorage.go:93] No metrics for pod stage-project/fit360-web-75dd99dbb4-jtwzp
I0912 02:30:02.397429       1 reststorage.go:93] No metrics for pod production/vivo-s7-web-7988646999-gvsng
I0912 02:30:02.397440       1 reststorage.go:93] No metrics for pod cert-manager/cert-manager-webhook-alidns-d5b8d5f9d-cgspg
I0912 02:30:02.397453       1 reststorage.go:93] No metrics for pod production/realibox-admin-web-66bbb86fd7-dgl2w
I0912 02:30:02.397474       1 reststorage.go:93] No metrics for pod production/tutorial-77487596c-mplk6
I0912 02:30:02.397485       1 reststorage.go:93] No metrics for pod production/studio-socket-server-67854dffbf-m9khr
I0912 02:30:02.397503       1 reststorage.go:93] No metrics for pod cert-manager/cert-manager-cainjector-869bb969f6-vlktk
I0912 02:30:02.397514       1 reststorage.go:93] No metrics for pod kube-system/alicloud-application-controller-6858d789b7-j6vz8
I0912 02:30:02.397534       1 reststorage.go:93] No metrics for pod production/realibox-open-admin-web-5b864bcb46-8npgh
I0912 02:30:02.397546       1 reststorage.go:93] No metrics for pod kube-system/cluster-autoscaler-5cbd7bb484-ppfdn
I0912 02:30:02.397556       1 reststorage.go:93] No metrics for pod stage/realibox-open-admin-web-c4798f9dc-2lqls
I0912 02:30:02.397565       1 reststorage.go:93] No metrics for pod default/gitlab-gitaly-0
I0912 02:30:02.397586       1 reststorage.go:93] No metrics for pod production-project/honda-breeze360-web-6db667f64f-5bwjs
I0912 02:30:02.397597       1 reststorage.go:93] No metrics for pod stage/realibox-cms-675c566b5d-t5trx
I0912 02:30:02.397612       1 reststorage.go:93] No metrics for pod cattle-system/cattle-node-agent-sk9zc
I0912 02:30:02.397682       1 reststorage.go:93] No metrics for pod production-project/honda-fit360-web-6c99d4f89-dtjxh
I0912 02:30:02.397705       1 reststorage.go:93] No metrics for pod production/realibox-account-sso-5f8c8668d9-9nl7b
I0912 02:30:02.397716       1 reststorage.go:93] No metrics for pod stage-project/honda-fit360-web-6977674bb4-w8d97
I0912 02:30:02.397724       1 reststorage.go:93] No metrics for pod stage-project/project-frame-6d7777bbbd-lzl26
I0912 02:30:02.397734       1 reststorage.go:93] No metrics for pod kube-system/coredns-66dfb6457b-575d8
I0912 02:30:02.397755       1 reststorage.go:93] No metrics for pod production-project/project-frame-7d6b4bffc5-4qjx7
I0912 02:30:02.397766       1 reststorage.go:93] No metrics for pod kube-system/tiller-deploy-747996788d-djj8q
I0912 02:30:02.397784       1 reststorage.go:93] No metrics for pod kube-system/alicloud-disk-controller-75bd74c84f-drfj2
I0912 02:30:02.397795       1 reststorage.go:93] No metrics for pod production/realibox-studio-editor-59879f6685-9sdrl
I0912 02:30:02.397804       1 reststorage.go:93] No metrics for pod production/realibox-official-website-85ccb8d4d8-ncn7k
I0912 02:30:02.397813       1 reststorage.go:93] No metrics for pod loging/fluentd-es-brlg7
I0912 02:30:02.397822       1 reststorage.go:93] No metrics for pod stage/studio-socket-server-56969d4b6d-wmnsd
I0912 02:30:02.397836       1 reststorage.go:93] No metrics for pod stage-project/honda-avancier360-web-75cbf47fdb-pk6sk
I0912 02:30:02.397846       1 reststorage.go:93] No metrics for pod cattle-system/cattle-cluster-agent-57b9855459-rz55g
I0912 02:30:02.397862       1 reststorage.go:93] No metrics for pod stage/realibox-new-studio-editor-7cd75b8bb4-8nzdc
I0912 02:30:02.397872       1 reststorage.go:93] No metrics for pod stage-studio/vivo-s7-web-6b7d6684c8-4qbth
I0912 02:30:02.397882       1 reststorage.go:93] No metrics for pod gitlab-runner/gitlab-runner-gitlab-runner-855ddf55c9-rxwrd
I0912 02:30:02.397892       1 reststorage.go:93] No metrics for pod cert-manager/cert-manager-webhook-7b4fb887bc-8mlvk
I0912 02:30:02.397902       1 reststorage.go:93] No metrics for pod production-dicastal/paas-ws-7b45958bd5-mq9l5
I0912 02:30:02.397912       1 reststorage.go:93] No metrics for pod production-project/venucia-web-5b45dff889-wldph
I0912 02:30:02.397924       1 reststorage.go:93] No metrics for pod production/tutorial-77487596c-rfl7k
I0912 02:30:02.397945       1 reststorage.go:93] No metrics for pod stage/paas-ws-5d59879d57-qkrd6
I0912 02:30:02.397957       1 reststorage.go:93] No metrics for pod kube-system/logtail-ds-m2ccf
I0912 02:30:02.397968       1 reststorage.go:93] No metrics for pod production/realibox-cms-b6fdc8fdf-29fkp
I0912 02:30:02.397978       1 reststorage.go:93] No metrics for pod cattle-system/cattle-node-agent-9zb2t
I0912 02:30:02.397989       1 reststorage.go:93] No metrics for pod production/realibox-open-admin-web-5b864bcb46-nlx6j
I0912 02:30:02.398011       1 reststorage.go:93] No metrics for pod production/paas-ws-68b57df74-4qdpr
I0912 02:30:02.398023       1 reststorage.go:93] No metrics for pod kube-system/kube-flannel-ds-52l8v
I0912 02:30:02.398047       1 reststorage.go:93] No metrics for pod default/sentry-v1-sentry-redis-slave-0
I0912 02:30:02.398060       1 reststorage.go:93] No metrics for pod stage-project/project-frame-6d7777bbbd-r229d
I0912 02:30:02.398071       1 reststorage.go:93] No metrics for pod stage/realibox-official-website-bfd9897c-5df5g
I0912 02:30:02.398081       1 reststorage.go:93] No metrics for pod kube-system/alicloud-nas-controller-7b6678f956-5gc2q
I0912 02:30:02.398098       1 reststorage.go:93] No metrics for pod kube-system/kube-proxy-worker-6mt2m
I0912 02:30:02.398121       1 reststorage.go:93] No metrics for pod production/realibox-admin-web-66bbb86fd7-2prcl
I0912 02:30:02.398132       1 reststorage.go:93] No metrics for pod stage/realibox-open-cloud-54f44b8946-5hptb
I0912 02:30:02.398159       1 reststorage.go:93] No metrics for pod stage-project/venucia-web-7f498f94b5-zqq2h
I0912 02:30:02.398170       1 reststorage.go:93] No metrics for pod kube-system/flexvolume-zjm67
I0912 02:30:02.398181       1 reststorage.go:93] No metrics for pod kube-system/flexvolume-f8thl
I0912 02:30:02.398216       1 reststorage.go:93] No metrics for pod kube-system/logtail-ds-sqsg9
I0912 02:30:02.398228       1 reststorage.go:93] No metrics for pod production/realibox-official-website-85ccb8d4d8-7g8rg
I0912 02:30:02.398243       1 reststorage.go:93] No metrics for pod kube-system/nginx-ingress-controller-584cd5888f-ngshm
I0912 02:30:02.398259       1 reststorage.go:93] No metrics for pod production/ui-design-editor-web-85cfd87c6f-wfg67
I0912 02:30:02.398280       1 reststorage.go:93] No metrics for pod kube-system/nginx-ingress-controller-584cd5888f-2qf5v
I0912 02:30:02.398290       1 reststorage.go:93] No metrics for pod kube-system/logtail-ds-zjxf7
I0912 02:30:02.398315       1 reststorage.go:93] No metrics for pod production/official-website-web-76c9bcc48b-7wft2
I0912 02:30:02.398326       1 reststorage.go:93] No metrics for pod kube-system/alicloud-monitor-controller-9d8c87b9c-vbc5z
I0912 02:30:05.181402       1 socket.go:38] Start ExportData 569 metrics.
I0912 02:30:05.185930       1 socket.go:172] Successful write 150711 bytes metrics to monitor server
I0912 02:30:05.388560       1 socket.go:172] Successful write 169285 bytes metrics to monitor server
I0912 02:30:05.591184       1 socket.go:172] Successful write 163600 bytes metrics to monitor server
I0912 02:30:05.793597       1 socket.go:172] Successful write 176898 bytes metrics to monitor server
I0912 02:30:05.997061       1 socket.go:172] Successful write 171690 bytes metrics to monitor server
I0912 02:30:06.199471       1 socket.go:172] Successful write 169629 bytes metrics to monitor server
I0912 02:30:06.401841       1 socket.go:172] Successful write 176908 bytes metrics to monitor server
I0912 02:30:06.605908       1 socket.go:172] Successful write 174532 bytes metrics to monitor server
I0912 02:30:06.811011       1 socket.go:172] Successful write 181207 bytes metrics to monitor server
I0912 02:30:07.014061       1 socket.go:172] Successful write 166899 bytes metrics to monitor server
I0912 02:30:07.216501       1 socket.go:172] Successful write 161945 bytes metrics to monitor server
I0912 02:30:07.419105       1 socket.go:172] Successful write 173384 bytes metrics to monitor server
I0912 02:30:07.623535       1 socket.go:172] Successful write 191966 bytes metrics to monitor server
I0912 02:30:07.826626       1 socket.go:172] Successful write 169906 bytes metrics to monitor server
I0912 02:30:08.028980       1 socket.go:172] Successful write 182795 bytes metrics to monitor server
I0912 02:30:08.231362       1 socket.go:172] Successful write 172012 bytes metrics to monitor server
I0912 02:30:08.436323       1 socket.go:172] Successful write 165722 bytes metrics to monitor server
I0912 02:30:08.639190       1 socket.go:172] Successful write 188747 bytes metrics to monitor server
I0912 02:30:08.841667       1 socket.go:172] Successful write 168491 bytes metrics to monitor server
I0912 02:30:09.044043       1 socket.go:172] Successful write 166887 bytes metrics to monitor server
I0912 02:30:09.246849       1 socket.go:172] Successful write 180298 bytes metrics to monitor server
I0912 02:30:09.449075       1 socket.go:172] Successful write 161786 bytes metrics to monitor server
I0912 02:30:09.652489       1 socket.go:172] Successful write 186195 bytes metrics to monitor server
I0912 02:30:09.854928       1 socket.go:172] Successful write 180837 bytes metrics to monitor server
I0912 02:30:10.059999       1 socket.go:172] Successful write 173586 bytes metrics to monitor server
I0912 02:30:10.262990       1 socket.go:172] Successful write 178088 bytes metrics to monitor server
I0912 02:30:10.466119       1 socket.go:172] Successful write 181089 bytes metrics to monitor server
I0912 02:30:10.668979       1 socket.go:172] Successful write 159140 bytes metrics to monitor server
I0912 02:30:10.872078       1 socket.go:172] Successful write 177979 bytes metrics to monitor server
I0912 02:30:11.074824       1 socket.go:172] Successful write 178470 bytes metrics to monitor server
I0912 02:30:11.275912       1 socket.go:172] Successful write 64549 bytes metrics to monitor server
I0912 02:30:13.445079       1 reststorage.go:140] No metrics for container drain-node in pod kube-system/drain-node
I0912 02:30:13.445101       1 reststorage.go:93] No metrics for pod kube-system/drain-node
I0912 02:30:13.445224       1 reststorage.go:93] No metrics for pod default/private-reg
I0912 02:30:13.445308       1 reststorage.go:93] No metrics for pod kube-system/cluster-autoscaler-5cbd7bb484-ppfdn
I0912 02:30:13.445335       1 reststorage.go:93] No metrics for pod default/gitlab-gitaly-0
已经挂了。
恢复
升级安装Kubernetes集群的metrics-server组件
参考文档：https://www.alibabacloud.com/help/zh/doc-detail/108316.htm
最终配置如下：
# cat metrics-server.yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin
  namespace: kube-system
---
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: admin
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin
  namespace: kube-system
---
apiVersion: v1
kind: Service
metadata:
  labels:
    task: monitoring
    # For use as a Cluster add-on (https://github.com/kubernetes/kubernetes/tree/master/cluster/addons)
    # If you are NOT using this as an addon, you should comment out this line.
    kubernetes.io/cluster-service: 'true'
    kubernetes.io/name: metrics-server
  name: heapster
  namespace: kube-system
spec:
  ports:
  - port: 80
    targetPort: 8082
  selector:
    k8s-app: metrics-server
---
apiVersion: v1
kind: Service
metadata:
  name: metrics-server
  namespace: kube-system
  labels:
    kubernetes.io/name: metrics-server
spec:
  selector:
    k8s-app: metrics-server
  ports:
  - port: 443
    protocol: TCP
    targetPort: 443
---
apiVersion: apiregistration.k8s.io/v1beta1
kind: APIService
metadata:
  name: v1beta1.metrics.k8s.io
spec:
  service:
    name: metrics-server
    namespace: kube-system
  group: metrics.k8s.io
  version: v1beta1
  insecureSkipTLSVerify: true
  groupPriorityMinimum: 100
  versionPriority: 100
---
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: metrics-server
  namespace: kube-system
  labels:
    k8s-app: metrics-server
spec:
  selector:
    matchLabels:
      k8s-app: metrics-server
  template:
    metadata:
      name: metrics-server
      labels:
        k8s-app: metrics-server
    spec:
      serviceAccountName: admin
      containers:
      - name: metrics-server
        image: registry.cn-shenzhen.aliyuncs.com/acs/metrics-server:v0.2.1-9dd9511-aliyun
        imagePullPolicy: Always
        command:
        - /metrics-server
        - '--source=kubernetes:https://kubernetes.default'
        - '--sink=socket:tcp://monitor.csk.cn-shenzhen.aliyuncs.com:8093?clusterId=c02e82b6adaf044bd94d251fea1279648&public=true'
恢复后
# kubectl top nodes
NAME                      CPU(cores)   CPU%   MEMORY(bytes)   MEMORY%
cn-shenzhen.172.16.0.81   476m         11%    4654Mi          31%
cn-shenzhen.172.16.0.87   275m         6%     5984Mi          40%
cn-shenzhen.172.16.0.88   369m         9%     8765Mi          58%
cn-shenzhen.172.16.0.89   473m         11%    4897Mi          32%
# kubectl top pods -A
NAMESPACE             NAME                                               CPU(cores)   MEMORY(bytes)
businesscard          businesscard-deployment-7dd845df6c-dfhhs           1m           20Mi
cattle-system         cattle-cluster-agent-57b9855459-rz55g              3m           98Mi
cattle-system         cattle-node-agent-9zb2t                            0m           22Mi
cattle-system         cattle-node-agent-hbzl6                            0m           31Mi
cattle-system         cattle-node-agent-sk9zc                            0m           29Mi
cattle-system         cattle-node-agent-xk9pn                            0m           37Mi
cert-manager          cert-manager-84fc69dbdf-hp9m7                      2m           23Mi
cert-manager          cert-manager-cainjector-869bb969f6-vlktk           3m           25Mi
cert-manager          cert-manager-webhook-7b4fb887bc-8mlvk              0m           15Mi
cert-manager          cert-manager-webhook-alidns-d5b8d5f9d-cgspg        1m           18Mi
default               sentry-v1-sentry-redis-master-0                    7m           5Mi
default               sentry-v1-sentry-redis-slave-0                     7m           3Mi
default               sentry-v1-sentry-redis-slave-1                     5m           5Mi
gitlab-runner         gitlab-runner-gitlab-runner-855ddf55c9-c96hx       4m           6Mi
gitlab-runner         gitlab-runner-gitlab-runner-855ddf55c9-rxwrd       2m           23Mi
kube-system           alibaba-log-controller-5477dbdc5c-xcp9j            1m           9Mi
kube-system           alicloud-application-controller-6858d789b7-j6vz8   1m           8Mi
kube-system           alicloud-disk-controller-75bd74c84f-drfj2          2m           5Mi
kube-system           alicloud-monitor-controller-9d8c87b9c-vbc5z        2m           32Mi
kube-system           alicloud-nas-controller-7b6678f956-5gc2q           2m           8Mi
kube-system           aliyun-acr-credential-helper-757974fd9b-vgd78      0m           33Mi
kube-system           coredns-66dfb6457b-575d8                           2m           18Mi
kube-system           coredns-66dfb6457b-q7tt8                           3m           13Mi
kube-system           flexvolume-5fw55                                   3m           29Mi
kube-system           flexvolume-8rdnl                                   2m           49Mi
kube-system           flexvolume-f8thl                                   3m           18Mi
kube-system           flexvolume-zjm67                                   3m           25Mi
kube-system           kube-flannel-ds-2s89d                              2m           15Mi
kube-system           kube-flannel-ds-52l8v                              2m           30Mi
kube-system           kube-flannel-ds-wwld7                              2m           16Mi
kube-system           kube-flannel-ds-zbfkc                              2m           46Mi
kube-system           kube-proxy-worker-6mt2m                            2m           18Mi
kube-system           kube-proxy-worker-dr6j4                            3m           40Mi
kube-system           kube-proxy-worker-l597t                            3m           41Mi
kube-system           kube-proxy-worker-njnzs                            3m           46Mi
kube-system           kubed-kubed-84d4498ffb-9slmk                       6m           536Mi
kube-system           logtail-ds-9zggv                                   9m           28Mi
kube-system           logtail-ds-m2ccf                                   8m           43Mi
kube-system           logtail-ds-sqsg9                                   8m           35Mi
kube-system           logtail-ds-zjxf7                                   8m           52Mi
kube-system           metrics-server-6bc4dcc6bd-2tscf                    7m           41Mi
kube-system           nginx-ingress-controller-584cd5888f-2qf5v          19m          197Mi
kube-system           nginx-ingress-controller-584cd5888f-djhjq          24m          204Mi
kube-system           nginx-ingress-controller-584cd5888f-gpzf9          10m          196Mi
kube-system           nginx-ingress-controller-584cd5888f-ngshm          14m          200Mi
kube-system           tiller-deploy-747996788d-djj8q                     0m           20Mi
loging                fluentd-es-46jzc                                   4m           207Mi
loging                fluentd-es-brlg7                                   3m           445Mi
production            help-docs-5c99c6d8d9-xm5gv                         0m           84Mi
production            official-website-web-76c9bcc48b-5smrl              0m           3Mi
production            official-website-web-76c9bcc48b-7wft2              0m           3Mi
production            paas-ws-68b57df74-4qdpr                            61m          568Mi
production            paas-ws-68b57df74-9rj6p                            63m          569Mi
production            realibox-account-sso-5f8c8668d9-9nl7b              0m           5Mi
production            realibox-admin-web-66bbb86fd7-2prcl                0m           5Mi
production            realibox-admin-web-66bbb86fd7-dgl2w                0m           5Mi
production            realibox-cms-b6fdc8fdf-29fkp                       0m           4Mi
production            realibox-cms-b6fdc8fdf-f2d46                       0m           5Mi
production            realibox-official-website-85ccb8d4d8-7g8rg         0m           7Mi
production            realibox-official-website-85ccb8d4d8-ncn7k         0m           3Mi
production            realibox-open-admin-web-5b864bcb46-8npgh           0m           3Mi
production            realibox-open-admin-web-5b864bcb46-nlx6j           0m           3Mi
production            realibox-open-cloud-bc4c9d5d-7jv4z                 0m           3Mi
production            realibox-studio-editor-59879f6685-9sdrl            0m           3Mi
production            realibox-studio-editor-59879f6685-dg9ps            0m           3Mi
production            studio-socket-server-67854dffbf-m9khr              0m           219Mi
production            tutorial-77487596c-mplk6                           1m           68Mi
production            tutorial-77487596c-rfl7k                           1m           69Mi
production            ui-design-editor-web-85cfd87c6f-8d86q              0m           3Mi
production            ui-design-editor-web-85cfd87c6f-wfg67              0m           3Mi
production            vivo-s7-web-7988646999-gvsng                       0m           3Mi
production            websocket-85fb8b49fd-bvm5m                         0m           15Mi
production            websocket-85fb8b49fd-wj85x                         0m           15Mi
production-dicastal   paas-ws-7b45958bd5-mq9l5                           0m           17Mi
production-project    dongfeng-venucia-web-7fbc4f9949-k5stl              0m           9Mi
production-project    dongfeng-venucia-web-7fbc4f9949-lk9rz              0m           10Mi
production-project    honda-avancier360-web-6ccd9cdcd7-6n8f8             0m           17Mi
production-project    honda-avancier360-web-6ccd9cdcd7-6nwz9             0m           11Mi
production-project    honda-breeze360-web-6db667f64f-5bwjs               0m           3Mi
production-project    honda-breeze360-web-6db667f64f-ph85v               0m           3Mi
production-project    honda-fit360-web-6c99d4f89-dtjxh                   0m           46Mi
production-project    honda-fit360-web-6c99d4f89-mpzlv                   0m           55Mi
production-project    project-frame-7d6b4bffc5-4qjx7                     0m           4Mi
production-project    project-frame-7d6b4bffc5-c5rvn                     0m           3Mi
production-project    venucia-web-5b45dff889-cfkx7                       0m           3Mi
production-project    venucia-web-5b45dff889-wldph                       0m           3Mi
stage                 paas-ws-5d59879d57-qkrd6                           0m           2Mi
stage                 realibox-account-sso-796756cdf-62fnm               0m           5Mi
stage                 realibox-admin-web-645d6d4b45-k7gx7                0m           3Mi
stage                 realibox-cms-675c566b5d-t5trx                      0m           4Mi
stage                 realibox-new-studio-editor-7cd75b8bb4-8nzdc        0m           3Mi
stage                 realibox-official-website-bfd9897c-5df5g           0m           6Mi
stage                 realibox-open-admin-web-c4798f9dc-2lqls            0m           3Mi
stage                 realibox-open-cloud-54f44b8946-5hptb               0m           3Mi
stage                 studio-editor-web-6f975f84cd-jd8q8                 0m           3Mi
stage                 studio-editor-web-6f975f84cd-mgjb2                 0m           3Mi
stage                 studio-socket-server-56969d4b6d-wmnsd              0m           131Mi
stage-project         dongfeng-venucia-web-5455895459-9pzpz              0m           3Mi
stage-project         fit360-web-75dd99dbb4-78srq                        0m           3Mi
stage-project         fit360-web-75dd99dbb4-jtwzp                        0m           3Mi
stage-project         honda-avancier360-web-75cbf47fdb-pk6sk             0m           3Mi
stage-project         honda-breeze360-web-78dfc6df56-8b2bm               0m           3Mi
stage-project         honda-fit360-web-6977674bb4-w8d97                  0m           3Mi
stage-project         project-frame-6d7777bbbd-lzl26                     0m           3Mi
stage-project         project-frame-6d7777bbbd-r229d                     0m           3Mi
stage-project         venucia-web-7f498f94b5-tgxlj                       0m           3Mi
stage-project         venucia-web-7f498f94b5-zqq2h                       0m           3Mi
stage-studio          realibox-ui-editor-6c4c8757f9-6xqnj                0m           2Mi
stage-studio          vivo-s7-web-6b7d6684c8-4qbth                       0m           3Mi
test                  test-ci-5568fbc9bc-lxpt7
👌！