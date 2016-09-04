[![Circle CI](https://circleci.com/gh/JTarball/codewheel-backend.svg?style=svg)](https://circleci.com/gh/JTarball/codewheel-backend)


<a href="http://www.djangoproject.com/" ><img src="https://www.djangoproject.com/m/img/badges/djangoproject120x25.gif" border="0" alt="A Django project." title="A Django project." style="float: right;" /></a>



#### Current Integrated Django Version

-	[`1.8.6`, `Django`](https://www.djangoproject.com/download/)

## Django Polymer start project using Docker

## Setup
- ALLOWED_HOSTS  REMEMBER TO ADD HOST NAME



### Useful Commands
`docker login`
  - you will need to login into docker hub (set up an account if you dont have one)
`docker build -t "<IMAGE>" .`
  - this will build the Dockerfile in the current directory and tag it with "jtarball/docker-base:latest"
`docker push "<IMAGE>"`
  - push to docker hub
`docker-compose up`
 - this command will create and start containers
l
 - kill and remove all docker images and containers
`docker rmi $(docker images -q --filter "dangling=true")`
 - Clean up un-tagged docker images
`docker stop $(docker ps -a -q)`
 - Stop all docker processes


Network timed out while trying to connect to https://index.docker.io/v1/repositories/library/debian/images. You may want to check you
docker-machine restart default      # Restart the environment
eval $(docker-machine env default)  # Refresh your environment settings


## How to use
1. Install Polymer FrontEnd Components
npm install -g gulp bower && npm install && bower install
`docker-compose run app --create`
set up databases / initial migrations / ...
`docker-compose up -d`





### Set up django project


#### Change site name
- change website name in /<admin_url>/sites/site/ from example.com to what ever the site is to be called.

#### Change email templates
- you will need to use mailchimp & mandrill
- create/edit templates with names in mailchimp (then send to mandrill):
* 'verify-email': A template to confirm registration using email 
* ''










### How to deploy to Amazon Web Services
1. Get AWS Access Key, AWS Secret Access Key & AWS VPC IPD
* [Get AWS Access Key & AWS Secret Access Key](http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSGettingStartedGuide/AWSCredentials.html)

* Services -> IAM 
* To get AWS VPC ID: Go to your IAM console, select Create VPC -> VPC ID should visible in one of the columns 
```
https://alexanderzeitler.com/articles/a-lap-around-aws-and-docker-machine/
pip install awscli
aws configure
aws ec2 describe-subnets

```
2. Ensure environment variables are set 
To deploy this project to AWS you must set the following environment variables:

* DOCKERHUB_USER
* AWS_ACCESS_KEY_ID
* AWS_SECRET_ACCESS_KEY
* AWS_VPC_ID

```
export DOCKERHUB_USER=jtarball
export AWS_ACCESS_KEY_ID=xxxxxx
export AWS_SECRET_ACCESS_KEY=xxxxxx
export AWS_VPC_ID=xxxx
```

3. Create Docker Machine  (Only if needs to be created - so only once)
`create-docker-machine-aws.sh  <MACHINE_NAME>` 
where MACHINE_NAME is the name for the machine you want created 
 
4.
`python build-tag-push.py` 
which will build the docker app, push it to docker hub and a new compose yml file (you will need to be logged in  `docker login`)

5. Check inbounds rules if need ports to work

6. deploy
https://docs.docker.com/machine/examples/aws/

https://developer.rackspace.com/blog/dev-to-deploy-with-docker-machine-and-compose/
- export environment variables
- staging (copy across)
docker-machine scp -r ~/Masterbox/sideprojects/github/tetherbox  prod:~/
- export env
- run docker-compose from inside box

7. build image
 - docker-machine start <production-machine>
 - eval $(docker-machine env <production-machine>)
 - docker-compose build
 - docker-compose up

You can have this in your prompt if you use my bash prompt definiton from here.

Using docker-machine ip awsdocker you can get the public IP address of your machine.

If you're deploying some containers, you might wonder, why you can`t access your containers exposed ports like http://<machine-ip>:<someport>: because firewall 😱.
https://alexanderzeitler.com/articles/a-lap-around-aws-and-docker-machine/vpcsecuritygroup.png
So head over to the EC2 dashboard "Security Groups" section, select your "docker-machine" Security Group (which has been created when spinning up your machine) and make sure to allow some inbound traffic:


static

------

cloudfront with options to limit to only static 

8. Serving stsatic files with whitenoise and CDN Amazon Cloudfront 
http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/GettingStarted.html
- docker storage cloudfront
https://docs.docker.com/registry/storage-drivers/s3/








## Directory Structure


## License

View [license information](https://github.com/JTarball/docker-base/blob/master/LICENSE) for the software contained in this image.

## User Feedback

Any feedback or comments  would be greatly appreciated: <james.tarball@gmail.com>















### Tutorial

* [Flux7's Dockerfile Tutorial](http://flux7.com/blogs/docker/docker-tutorial-series-part-3-automation-is-the-word-using-dockerfile/)

## Layers

The versioned filesystem in Docker is based on layers.  They're like [git commits or changesets for filesystems](https://docs.docker.com/terms/layer/).

Note that if you're using [aufs](https://en.wikipedia.org/wiki/Aufs) as your filesystem, Docker does not always remove data volumes containers layers when you delete a container!  See [PR 8484](https://github.com/docker/docker/pull/8484) for more details.

## Links

Links are how Docker containers talk to each other [through TCP/IP ports](https://docs.docker.com/userguide/dockerlinks/).  [Linking into Redis](https://docs.docker.com/examples/running_redis_service/) and [Atlassian](https://blogs.atlassian.com/2013/11/docker-all-the-things-at-atlassian-automation-and-wiring/) show worked examples.  You can also (in 0.11) resolve [links by hostname](https://docs.docker.com/userguide/dockerlinks/#updating-the-etchosts-file).

NOTE: If you want containers to ONLY communicate with each other through links, start the docker daemon with `-icc=false` to disable inter process communication.

If you have a container with the name CONTAINER (specified by `docker run --name CONTAINER`) and in the Dockerfile, it has an exposed port:

```
EXPOSE 1337
```



































Docker linguistics borrow from git terminology, but it’s rather dangerous to interpret these too literally.
Keeping a clean docker environment

run interactive containers with --rm flag to avoid having to remove them later.

Remove all stopped containers:

Clean up un-tagged docker images:
docker rmi $(docker images -q --filter "dangling=true")
Stop and remove all containers (including running containers!)
Docker and Continuous Integration



> docker stop $(docker ps -a -q); docker rm $(docker ps -a -q); docker rmi $(docker images -q);
> 
> 
> 
> 
> 
> 
> 
> docker run -v /Users/danvir/Masterbox/sideprojects/github/docker-django-polymer/app_mount:/app -i -t dockerdjangopolymer_app_1


# Run tests on app
py.test --ds=project.settings.test  <app dir>
REUSE_DB=0 python manage.py test --settings=project.settings.test -s --with-queries blog


# AWS EB
https://realpython.com/blog/python/deploying-a-django-app-to-aws-elastic-beanstalk/


### Files

* **README.md**
  - this file
* **app/**
  - docker for app including development files for django and polymer 
  - derived from 'jtarball/docker-base' (automated build from docker hub)
  - your project directory is in here
* **config/**
  - configuration files for docker
  - docker compose .ymls for different environments
  - env files for different environments
* **deployment/**
  - deployment scripts (create dockerfile for deployment, create amazon aws machine etc.)
* **nginx/**      
  - docker files for nginx service 
* **tests/**      
  - docker tests

### 'app' directory
This is the main docker image used for this project. This folder contains a directory 
which will contain all development files (django). This is shared for development.

### Useful Docker Commands
`docker login`
  - you will need to login into docker hub (set up an account if you dont have one)
`docker build -t "<IMAGE>" .`
  - this will build the Dockerfile in the current directory and tag it with "jtarball/docker-base:latest"
`docker push "<IMAGE>"`
  - push to docker hub
`docker-compose up`
 - this command will create and start containers
`docker rm $(docker ps -a -q); docker rmi $(docker images -q);`
 - kill and remove all docker images and containers
`docker rmi $(docker images -q --filter "dangling=true")`
 - Clean up un-tagged docker images
`docker stop $(docker ps -a -q)`
 - Stop all docker processes

### Issues

If you have any problems with or questions about this image, please contact us through a [GitHub issue](https://github.com/JTarball/codewheel-backend/issues).

You can also reach me by email. I would be happy to help  <james.tarball@gmail.com>

### Considerations / Future
In the future I might consider incorporating ideas from the following projects:

* https://github.com/imkevinxu/django-kevin
* https://github.com/luzfcb/cookiecutter-django-oauth
* https://github.com/pydanny/cookiecutter-django

*e.g. caching, sendGrid email support, heroku, better management*
