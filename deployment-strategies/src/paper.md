# Introduction

Continuous Delivery is a fairly simple task in a monolithic system: all required configuration is instructions to build and test the monolithic application, and how to deploy it. With few releases every day, it can even be feasible to maintain a continuous stream of releases without any automation. Automation of such as system may simply mean introducing a single build server that builds, tests, and deploys the system whenever new code is pushed to the revision control system.

A microservice-based system, however, introduces a whole new set of complications. In a relatively large system with hundreds of microservices, the system may see hundreds, or even thousands, of deployments in a single day. Introducing the microservice architecture in an existing project may require a distribution of deployment responsibilities: a single person, or even team, cannot handle the influx of new versions to deploy.

With this rise of tools for packaging, testing, deploying, and scaling services, those in charge of selecting deployment strategies and committing to an underlying technology stack have few tools to guide them.

# Background

@talwar:comparison-of-approaches-to-service-deployment:2005 [p. 1] broadly define a _service_ as a piece of software that encapsulates and presents some useful functionality, and can be part of an overall _system_. In other words, a _service_ is a specialised, autonomous, stand-alone server. The idea of splitting a large application's code base into multiple services is often referred to as the Service-Oriented Architecture (SOA) [e.g., @castro:evaluating:2015; @arnold:pattern-based-soa:2007].

# Case study

# Evaluation framework

# Conclusion and further research
