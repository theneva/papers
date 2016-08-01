# Introduction

Continuous Delivery is a fairly simple task in a monolithic system: all required configuration is instructions to build and test the monolithic application, and how to deploy it. With few releases every day, it can even be feasible to maintain a continuous stream of releases without any automation. Automation of such as system may simply mean introducing a single build server that builds, tests, and deploys the system whenever new code is pushed to the revision control system.

A microservice-based system, however, introduces a whole new set of complications. In a relatively large system with hundreds of microservices, the system may see hundreds, or even thousands, of deployments in a single day. Introducing the microservice architecture in an existing project may require a distribution of deployment responsibilities: a single person, or even team, cannot handle the influx of new versions to deploy.

In the current literature, measuring the quality of a software deployment pipeline is almost exclusively done in a quantitative manner. Frequent metrics include number of steps to perform a deployment, and lines of code to change the configuration. While useful, these metrics fail to consider that there are people using the strategies to progress projects. In a real setting, counting the lines of code required to make a change can be worthless in evaluating the value created by the deployment configuration.

With this rise of tools for packaging, testing, deploying, and scaling services, those in charge of selecting deployment strategies and committing to an underlying technology stack have few tools to guide them.
