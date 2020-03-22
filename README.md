# gitopsify Quickstart

gitopsofy is a Jenkins-X quickstart app that uses the JX Git Buildpack to add gitops automation to any repo of your choosing, regardless of the contents of the repo. When you use gitopsify as a quickstart or with jx import, it will utilize the kubernetes cluster your jx instance is running on to implement a tekton pipeline and prow configuration to deliver gitops automations to your target repo. 

gitopsify also adds post-pr and post-merge processing scripts that allows you to execute functions against the contents of a pull request.
- The **post-pr** script is intended to execute functions on the contents of pull requests that are submitted to a repo, after which the results are merged into the same pull request
  - For example, you could utilize functions that ensure a user submission conforms to a given policy, add standard header/footer/other text to submitted documents, run pandoc or conversion tool to convert user input in a given format (docx, md) to another format such as html and automate steps needed to update github.io as just a few examples. 
- The **post-merge** script runs after the effects of the post-pr script are merged into the user-submitted pull request, to handle any functions where results should not be merged back into the repository
  - For example, you could execute a script in an external system based on the submitted pr contents, make custom log entries, make a api/webhook call or send update to message queue to notify status of new pullrequest ready for review as just a few examples

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

Note: If you only want to add gitops automations and do not want to use the post-pr and post-merge processing scripts, you can simply add a jenkins-x.yml file with one line 'buildpack: git`, and then you can target the repo with jx import and jx will add gitops automations for the target repo

### 1.4 Use gitopsify to create a new repo preconfigured with gitops automations

#### 1.4.1 Run the following command to add kampfires as a Quickstart location for your team:

`jx create quickstartlocation --url https://github.com --owner kampfires --kind github`  

To get the list of registered quickstart locations run command:

`jx get quickstartlocations`  

#### 1.4.2 Run the Following command to to initiate the quickstart wizard which will create your own kubefeed instance for you.
`jx create quickstart --owner kampfires --filter gitopsify-quickstart`
