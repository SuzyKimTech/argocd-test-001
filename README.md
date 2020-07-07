# 로컬 PC Kubernetes에 CD/CD Pipeline Tool 설치하기
## 사전 준비
### 1) MacOS 에서 설치함
### 2) homebrew 설치
```
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```
> https://brew.sh/index_ko 참고
### 3) Docker Desktop 설치
```
$ brew cask install docker
```
### 4) Docker Desktop 설정에서 Kubernetes 사용함으로 설정
### 5) Docker Desktop 설정에서 리소스 제한을 늘려줌
### 6) Helm 2 버전 설치 및 초기화
```
$ brew install helm@2
$ which helm
$ cd /usr/local/opt/helm@2/bin
$ mv helm helm2
$ helm2 version
$ helm2 init
```
> init 명령어로 초기화를 해주어야 함
### 7) Helm 3 버전 설치
```
$ brew install helm
$ which helm
$ cd /usr/local/bin/helm
$ mv helm helm3
$ helm3 version
```
### 8) Github에서 소스 다운로드
```
$ git clone https://github.com/ounju/argocd-test-001.git
```
> ArgoCD 설치하면 argocd-test-001 프로젝트 경로가 등록되어 있음
### 9) /etc/hosts 파일에 개발용 도메인 등록
```
$ sudo vi /etc/hosts
```
> hosts 파일에 아래 도메인 등록  
> 도메인으로 접속해야 Nginx에서 정상적으로 라우팅 함
```
127.0.0.1   docker.inf.com    nexus.inf.com
127.0.0.1   mariadb.inf.com    
127.0.0.1   gitlab.gitlab.inf.com    registry.gitlab.inf.com    minio.gitlab.inf.com
127.0.0.1   argocd.inf.com
127.0.0.1   jenkinsci.inf.com    jenkinscd.inf.com    workflow.inf.com   
127.0.0.1   grafana.inf.com    prometheus.inf.com    keycloak.inf.com
```

## 설치 순서
1. `nginx-ingress`
1. `argo-cd`
1. `sonatype-nexus`
1. `mariadb`
1. `jenkins-workflow`
1. `jenkins-ci`
1. `jenkins-cd`
1. prometheus
1. grafana
1. keycloak
1. `gitlab` (작업중)
> 8, 9, 10번은 설치 생략 가능  
> 1번은 helm3로 설치  
> 2번은 helm2로 설치  
> 3~10번은 ArgoCD를 이용하여 설치  
> 11번(Gitlab)은 ArgoCD로 설치 안됨, helm3로 설치

### 1) nginx-ingress 설치
```
$ cd {argocd-test-001 다운로드 폴더}
$ chmod 777 install-nginx-ingress.sh
$ ./install-nginx-ingress.sh
```
### 2) argo-cd 설치
```
$ cd {argocd-test-001 다운로드 폴더}
$ chmod 777 install-argocd.sh
$ ./install-argocd.sh
```
> https://argocd.inf.com 접속 (admin/admin123)
### 3) sonatype-nexus 설치
> ArgoCD에서 설치한다.
1. NEW APP 버튼 클릭
1. Application 정보 입력
+ Application name : sonatype-nexus
+ Project : default
+ SYNC POLICY : Manual
+ Repository URL : https://github.com/ounju/argocd-test-001.git
+ Revision : HEAD
+ Path : `sonatype-nexus`
+ Cluster : https://kubernetes.default.svc
+ Namespace : `default`
+ VALUES FILES : `values.yaml`
3. CREATE 버튼 클릭
3. SYNC 버튼 클릭

### 4) mariadb 설치
> ArgoCD에서 설치한다.  
> sonatype-nexus와 동일한 방식으로 설치한다.

### 5) jenkins-workflow 설치
> ArgoCD에서 설치한다.  
> sonatype-nexus와 동일한 방식으로 설치한다.
### 6) jenkins-ci 설치
> ArgoCD에서 설치한다.  
> sonatype-nexus와 동일한 방식으로 설치한다.
### 7) jenkins-cd 설치
> ArgoCD에서 설치한다.  
> sonatype-nexus와 동일한 방식으로 설치한다.
### 8) prometheus 설치
> ArgoCD에서 설치한다.  
> sonatype-nexus와 동일한 방식으로 설치한다.
### 9) grafana 설치
> ArgoCD에서 설치한다.  
> sonatype-nexus와 동일한 방식으로 설치한다.

### 10) keycloak 설치
> ArgoCD에서 설치한다.  
> sonatype-nexus와 동일한 방식으로 설치한다.  
> https://keycloak.inf.com (keycloak/admin12345)

### 11) gitlab 설치 (작업중)
```
$ cd {argocd-test-001 다운로드 폴더}
$ chmod 777 install-gitlab.sh
$ ./install-gitlab.sh
```
> https://gitlab.inf.com 접속
