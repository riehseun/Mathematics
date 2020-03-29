job('seed-job') {
    logRotator(-1, -1, -1, -1)
    restrictToLabel('jnlp')

    scm {
        github('https://github.com/riehseun/dsl-scripts.git', 'master')
    }

    steps {
        dsl(['jenkins2/createJobs.groovy'], 'DELETE')
    }

}

queue('ssed-job')