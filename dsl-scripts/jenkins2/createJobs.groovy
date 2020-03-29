// import com.rieh.dsl.JobDSLUtils

def folders = [
    "PIPELINE"
]
createFolder(this, folders)

/**
* To add a multi-branch pipeline job in Jenkins, follow this guideline
* 1st item: add name of the job including its path
* 2nd item: add git clone url
* 3rd item: add ID of Credential stored in Jenkins that has read-access to the git repository
* 4th item: if you only want to build particular branches, include them in this list. Otherwise, leave it empty
*/
def multiBranchJobs = [
    ["PIPELINE/date-display-app", "https://github.com/riehseun/date-display-app", "", ["master"], "Jenkinsfile-PIPELINE"]
]
createMultibranchPipelineJob(this, multiBranchJobs)

def createFolder(Object context, List folders) {
    context.with {
        folders.each { item ->
            folder(item)
        }
    }
}

def createMultibranchPipelineJob(Object context, List jobs) {
    context.with {
        jobs.each { job ->
            String jobName = job[0]
            String gitCloneUrl = job[1]
            String credential = job[2]
            List branchesToPull = job[3]
            String jenkinsfileId = job[4]
            multibranchPipelineJob(jobName) {
                branchSources {
                    git {
                        remote(gitCloneUrl)
                        credentialsId(credential)
                        if (branchesToPull.size() > 0) {
                            String branches = ""
                            branchesToPull.each { branch ->
                                branches += branch
                                branches += " "
                            }
                            branches = branches.substring(0, branches.length() - 1)
                            includes(branches)
                        }
                    }
                }
                orphanedItemStrategy {
                    discardOldItems {
                        numToKeep(10)
                    }
                }
                factory {
                    pipelineBranchDefaultsProjectFactory {
                        scriptId jenkinsfileId
                        useSandbox true
                    }
                }
            }
        }
    }
}