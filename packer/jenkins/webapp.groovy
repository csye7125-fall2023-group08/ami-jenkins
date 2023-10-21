multibranchPipelineJob('webapp') {
    displayName('webapp_pipeline')
    branchSources {
        git {
            id('123456789-webapp') // IMPORTANT: use a constant and unique identifier
            remote('https://github.com/cyse7125-fall2023-group08/webapp.git')
            credentialsId('token-github')
            configure { node ->
                def webhookTrigger = node / triggers / 'com.igalg.jenkins.plugins.mswt.trigger.ComputedFolderWebHookTrigger' {
                spec('')
                token("webapp")
            }
        }
        }
    }
}


