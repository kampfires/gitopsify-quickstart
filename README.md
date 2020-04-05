# gitopsify Quickstart

gitopsofy is a Jenkins-X quickstart app that uses the JX Git Buildpack to add gitops automation to any repo of your choosing, regardless of the contents of the repo. When you use gitopsify as a quickstart or with jx import, it will utilize the kubernetes cluster your jx instance is connected to and implements a tekton pipeline and prow configuration to deliver gitops automations to your target repo. 

gitopsify also adds a post-merge script handler that allows you to execute functions after a pullRequest is approved, including actions that modify the updates from the pullRequest and then automerge the effects of your defined functions.

To execute custom steps after a pullRequest is approved, please update the ./pipescripts/post-merge-run.sh file per the instructions/comments in the file. 

## Requirements
gitopsify requires Jenkins-X with Tekton Pipelines running on a Kubernetes cluster.

gitopsify should work with most versions of Jenkins-x, initially it has been tested against JX v2.0.1185

## How To setup use the gitopsify pipeline
We will need to use Jx Quickstart commands to create your own gitopsify instance from this quickstart template

### 1.1 Ensure you are logged into JX and authenticated to the Kubernetes cluster you would like to execute the gitposify pipeline

Note: You can use the gitopsify pipeline on as many target repositories as can be supported by your Jenkins-X implementation. 

### 1.2 Choose how you will use the gitopsify pipeline

You can use the gitopsify pipeline to add gitops automation to an existing repository, or create a new repository preconfigured with gitops automations that you can then add your desired files to. 

### 1.3 Use gitopsify with an existing repository

To use gitopsify on an existing repository:
- Add the [gitopsify pipeline file](https://github.com/kampfires/gitopsify-quickstart/blob/master/jenkins-x.yml) to the root directory of an existing repo you would like to add gitops automations to.
- Copy the gitopsify [pipescripts]() directory to the target repository.
- Use the [jx import command](https://jenkins-x.io/commands/jx_import/) targeting the repo you want to gitopsify and jx will import and setup gitops automations for the target repo.  

### 1.4 Use gitopsify to create a new repo preconfigured with gitops automations

#### 1.4.1 Run the following command to add kampfires as a Quickstart location for your team:

`jx create quickstartlocation --url https://github.com --owner kampfires --kind github`  

To get the list of registered quickstart locations run command:

`jx get quickstartlocations`  

#### 1.4.2 Run the Following command to to initiate the quickstart wizard which will create your own kubefeed instance for you.
`jx create quickstart --owner kampfires --filter gitopsify-quickstart`
