pipeline {

    // agent {
    //     docker {
    //         image 'node:alpine'
    //     }
    // }

    agent any

    environment {
        PASSWORD = credentials('DOCKER_PASSWORD')
        REPOSITORY_TEST_TAG="${DOCKER_HUB_USER_NAME}/node-app-test:${BUILD_ID}"
        REPOSITORY_PROD_TAG="${DOCKER_HUB_USER_NAME}/node-app:${BUILD_ID}"
        CONTAINER_NAME="node-app-test-${BUILD_ID}"
        }

    options {
        timeout(time: 1, unit: 'HOURS')
    }

    stages {

        stage('Clean WS and GIT Pull') {
            steps {
                cleanWs()
                git credentialsId: 'GitHub', url: "https://github.com/Gauravjain449/server.git"
            }

        }
        
        // stage('Docker build Test image') {
        //     steps {
        //         sh 'docker build -t ${REPOSITORY_TEST_TAG} -f Dockerfile.dev .'
        //     }
        // }

        //  stage('Docker Test image') {
        //     steps {
        //         sh 'docker run --name=${CONTAINER_NAME} -e CI=true ${REPOSITORY_TEST_TAG} npm run test'
        //     }
        // }

        // stage('Docker delete Test image') {
        //     steps {
        //         sh 'docker rm ${CONTAINER_NAME}'
        //         sh 'docker rmi ${REPOSITORY_TEST_TAG}'
        //     }
        // }

        stage('Docker build Prod image') {
            steps {
                sh 'docker build -t ${REPOSITORY_PROD_TAG} .'
            }
        }

        stage('Docker image push') {
            steps {
                sh 'echo "${PASSWORD}" | docker login -u "${DOCKER_HUB_USER_NAME}" --password-stdin'
                sh 'docker push ${REPOSITORY_PROD_TAG}'
            }
        }

        stage('kubernetes deployment') {
            steps {
                // sh 'envsubst < ${WORKSPACE}/deploy.yaml | kubectl delete -f -'
                sh 'envsubst < ${WORKSPACE}/deploy.yaml | kubectl apply  -f -'
            }
        }



    }
       
}


