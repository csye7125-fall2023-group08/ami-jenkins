multibranchPipelineJob('webapp-helm-chart') {
    displayName('webapp_helm_chart_pipeline')
    branchSources {
        git {
            id('123456789-helm-chart') // IMPORTANT: use a constant and unique identifier
            remote('https://github.com/csye7125-fall2023-group08/webapp-helm-chart.git')
            credentialsId('token-github')
            configure { node ->
                def webhookTrigger = node / triggers / 'com.igalg.jenkins.plugins.mswt.trigger.ComputedFolderWebHookTrigger' {
                    spec('')
                    token("webapp-helm-chart")
                }
            }
        }
    }
}