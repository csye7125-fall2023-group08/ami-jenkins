multibranchPipelineJob('webapp-DB') {
    displayName('webapp_DB_pipeline')
    branchSources {
        git {
            id('123456789') // IMPORTANT: use a constant and unique identifier
            remote('git@github.com:cyse7125-fall2023-group08/webapp-db.git')
            credentialsId('ssh-github')

        }
    }
   
    
}