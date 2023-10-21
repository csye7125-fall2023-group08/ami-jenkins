multibranchPipelineJob('webapp-DB') {
    displayName('webapp_DB_pipeline')
    branchSources {
        git {
            id('123456789-db') // IMPORTANT: use a constant and unique identifier
            remote('https://github.com/cyse7125-fall2023-group08/webapp-db.git')
            credentialsId('token-github')
            configure { node ->
                def webhookTrigger = node / triggers / 'com.igalg.jenkins.plugins.mswt.trigger.ComputedFolderWebHookTrigger' {
                spec('')
                token("webapp-db")
            }
        }
        }
    }
   
    
}