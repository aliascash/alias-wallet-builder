#!groovy

node('docker') {
    def spectre_builder

    stage('Clone repository') {
        checkout scm
    }

    stage('Build Debian image') {
        spectre_builder = docker.build("spectreproject/spectre-builder")
    }
    stage('Push Debian image') {
        docker.withRegistry('https://registry.hub.docker.com', '051efa8c-aebd-40f7-9cfd-0053c413266e') {
//            spectre_builder.push("${env.BUILD_NUMBER}")
            spectre_builder.push("latest")
        }
    }

    stage('Build CentOS image') {
        // Copy step on Dockerfile is not working if Dockerfile is not located on root dir!
        // So copy required Dockerfile to root dir for each build
        sh "cp ./CentOS/Dockerfile ."
        spectre_builder = docker.build("spectreproject/spectre-builder-centos")
        sh "rm Dockerfile"
    }
    stage('Push CentOS image') {
        docker.withRegistry('https://registry.hub.docker.com', '051efa8c-aebd-40f7-9cfd-0053c413266e') {
//            spectre_builder.push("${env.BUILD_NUMBER}")
            spectre_builder.push("latest")
        }
    }

    stage('Build Fedora image') {
        // Copy step on Dockerfile is not working if Dockerfile is not located on root dir!
        // So copy required Dockerfile to root dir for each build
        sh "cp ./Fedora/Dockerfile ."
        spectre_builder = docker.build("spectreproject/spectre-builder-fedora")
        sh "rm Dockerfile"
    }
    stage('Push Fedora image') {
        docker.withRegistry('https://registry.hub.docker.com', '051efa8c-aebd-40f7-9cfd-0053c413266e') {
//            spectre_builder.push("${env.BUILD_NUMBER}")
            spectre_builder.push("latest")
        }
    }

    stage('Build Raspberry Pi image') {
        spectre_builder = docker.build("spectreproject/spectre-builder-raspi", "./RaspberryPi/")
    }
    stage('Push Raspberry Pi image') {
        docker.withRegistry('https://registry.hub.docker.com', '051efa8c-aebd-40f7-9cfd-0053c413266e') {
//            spectre_builder.push("${env.BUILD_NUMBER}")
            spectre_builder.push("latest")
        }
    }

    stage('Build Ubuntu image') {
        // Copy step on Dockerfile is not working if Dockerfile is not located on root dir!
        // So copy required Dockerfile to root dir for each build
        sh "cp ./Ubuntu/latest/Dockerfile ."
        spectre_builder = docker.build("spectreproject/spectre-builder-ubuntu")
        sh "rm Dockerfile"
    }
    stage('Push Ubuntu image') {
        docker.withRegistry('https://registry.hub.docker.com', '051efa8c-aebd-40f7-9cfd-0053c413266e') {
//            spectre_builder.push("${env.BUILD_NUMBER}")
            spectre_builder.push("latest")
        }
    }

//    stage('Build Ubuntu 16LTS image') {
//        // Copy step on Dockerfile is not working if Dockerfile is not located on root dir!
//        // So copy required Dockerfile to root dir for each build
//        sh "cp ./Ubuntu/16LTS/Dockerfile ."
//        spectre_builder = docker.build("spectreproject/spectre-builder-ubuntu-16lts")
//        sh "rm Dockerfile"
//    }
//    stage('Push Ubuntu 16LTS image') {
//        echo("Push of Ubuntu 16-LTS image disabled at the moment...")
////        docker.withRegistry('https://registry.hub.docker.com', '051efa8c-aebd-40f7-9cfd-0053c413266e') {
////            spectre_builder.push("${env.BUILD_NUMBER}")
////            spectre_builder.push("latest")
////        }
//    }
}