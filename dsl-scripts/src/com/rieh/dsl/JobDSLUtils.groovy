package com.rieh.dsl

public class JobDSLUtils {
    static void createFolder(Object context, List folders) {
        context.with {
            folders.each { item ->
                folder(item)
            }
        }
    }

    static void createMultibranchPipelineJob(Object context, List jobs) {
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
                            useSandbox false
                        }
                    }
                }
            }
        }
    }
}