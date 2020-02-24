# gitopsify Quickstart

gitopsofy is a pipeline app that uses Jenkins-X to configure Gitops automations on an arbitrary git repository. 

When you initialize a repo with the gitopsify pipeline, it will create a tekton pipeline in your kubernetes cluster that sets up a webhook on the target repo with prow including chatops setup, sets up your jx-bot on the repo, automates semantic versioning, git tagging and repo packaging for each merge to the repo. 

Gitopsify should work on any repo, regardless of what the contents of the repo are, as long as the gitopsify pipeline is placed in the root directory of the repo.  

## Requirements
gitopsify requires Jenkins-X with Tekton Pipelines running on a Kubernetes cluster.

gitopsify should work with most versions of Jenkins-x, initially it has been tested against JX v2.0.1185

## How To setup use the gitopsify pipeline
We will need to use Jx Quickstart commands to create your own Kubefeed instance from this quickstart template

### 1.1 Ensure you are logged into JX and authenticated to the Kubernetes cluster you would like to execute the gitposify pipeline

Note: Gitopsify is not an independent application, it is a pipeline extension that is added to a new or existing repository. You can use the gitopsify pipeline on as many target repositories as can be supported by your Jenkins-X implementation. 

### 1.2 Choose how you will use the gitopsify pipeline

You can use the gitopsify pipeline to add gitops automation to an existing repository, or create a new repository preconfigured with gitops automations that you can then add your desired files to. 

### 1.3 Use gitopsify with an existing repository

To use gitopsify on an existing repository, simply add the [gitopsify pipeline file]() to the root directory of an existing repo, and then us the [jx import command](https://jenkins-x.io/commands/jx_import/) targeting the repo, jx will import and setup gitops automations for the target repo.  

### 1.4 Use gitopsify to create a new repo preconfigured with gitops automations

#### 1.4.1 Run the following command to add kampfires as a Quickstart location for your team:

`jx create quickstartlocation --url https://github.com --owner kampfires --kind github`  

To get the list of registered quickstart locations run command:

`jx get quickstartlocations`  

#### 1.4.2 Run the Following command to to initiate the quickstart wizard which will create your own kubefeed instance for you.
`jx create quickstart --owner kampfires --filter gitopsify-quickstart`
