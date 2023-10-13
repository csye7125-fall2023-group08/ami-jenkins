multibranchPipelineJob('webapp') {
    displayName('webapp_pipeline')
    branchSources {
        git {
            id('123456789') // IMPORTANT: use a constant and unique identifier
            remote('git@github.com:cyse7125-fall2023-group08/webapp.git')
            credentialsId('ssh-github')

        }
    }
   
    
}
    

