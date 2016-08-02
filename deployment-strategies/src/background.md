# Background

@talwar:comparison-of-approaches-to-service-deployment:2005 [p. 1] broadly define a _service_ as a piece of software that encapsulates and presents some useful functionality, and can be part of an overall _system_. In other words, a _service_ is a specialised, autonomous, stand-alone server. The idea of splitting a large application's code base into multiple services is often referred to as the Service-Oriented Architecture (SOA) [e.g., @castro:evaluating:2015; @arnold:pattern-based-soa:2007].

@evans-fowler:domain-driven-design:2003 [p. 1] used the term _domain_  about the _subject area_ to which a piece of software is applied. In this context, the entire set of services is a software expression of the domain: it both contains the data, and provides means of accessing and manipulating it. A domain has multiple contexts, especially on big projects, so it is important to define _Bounded Contexts_^[http://martinfowler.com/bliki/BoundedContext.html] in which a model applies [@evans-fowler:domain-driven-design:2003, pp. 298--299]. A project should initially be a monolith, and be decomposed into microservices as it grows in size and complexity [@newman:building-microservices:2015, loc. 804].

Each _client_ in a system is an expression of a Bounded Context. A client has traditionally meant a website, rendered to static assets (HTML, CSS, and JavaScript) on the server before being sent to the end user's web browser. In a system with only microservices and clients, the client connects directly to one or more services. It is then the client's task to combine data in a meaningful way and display it to the user.

With the rise of front-end JavaScript frameworks such as Google's AngularJS^[https://angularjs.org/] and Facebook's React^[https://facebook.github.io/react/], it has become a common industry practise to build an _API Gateway_^[https://www.nginx.com/blog/building-microservices-using-an-api-gateway] in addition to the web client. An API Gateway is reminiscent of the classic _façade pattern_ [@gof] from object-oriented programming: the single responsibility of the API Gateway is to combine data from the various microservices within the Bounded Context, and expose the data to the client through a tailored web API. In this pattern, each API Gateway represents a single Bounded Context.

@castro:evaluating:2015 [p. 590] conclude that there are several benefits to being able to publish a system as a set of smaller services that can be managed independently. Specifically, they point to independent development, deployment, scaling, operation, and monitoring as a key enabler for companies to manage large applications with a more practical methodology, and scale individual development teams more easily.

The _CAP Theorem_ states that it is impossible for a system to meet all attributes at the same time [@brewer:cap:2012], as shown in @erb:2012's Figure @fig:cap-venn-diagram.

![CAP theorem as a Venn diagram [@erb:2012]](http://img.ctrlv.in/img/16/05/20/573e4fbf0a685.png){#fig:cap-venn-diagram width=50%}

## Software deployment

@wahaballa:unified:2015 [p. 211] define software deployment as "all of the activities that make a software system available for use.". Following this definition, deployment is something every single provider of an online service must handle in some way. Deployment strategies can range from being extremely simple---e.g., by logging onto a server and manually editing some PHP code running in production---to comprehensive code review processes followed by running a pre-built artefact through several layers of automated tests, multiple test environments for manual quality assurance involving layers of bureaucracy, and finally deploying the new changes functions to a controlled subset of the production servers (known as blue/green deployment[^blue-green-deployment]) and a fraction of the end users of the service (known as canary release[^canary-release]).

[^blue-green-deployment]: http://martinfowler.com/bliki/BlueGreenDeployment.html
[^canary-release]: http://martinfowler.com/bliki/CanaryRelease.html

Software deployment is a dominating system administration cost, and configuration is a major error source [@talwar:comparison-of-approaches-to-service-deployment:2005]. As the popularity of service-based computing rises, so does the importance of answering which deployment approach is the best fit for the context [@talwar:approaches-for-service-deployment:2005].

@talwar:comparison-of-approaches-to-service-deployment:2005 define and compare four different approaches to deployment of services: manual, script-based, language-based, and model-based as a function of scale, complexity, and susceptibility to change. They also define a few evaluation metrics which they call Quality of Manageability (QoM) for the deployment configuration:

- Lines of code (LOC) for deployment configuration;
- Number of steps involved in deployment;
- LOC to express configuration changes; and
- Time to develop, and deploy a change.

They conclude that for systems with few deployed services and configuration changes, a manual solution is the most reasonable approach. Few deployed systems with comprehensive configuration changes call for a script-based approach. Larger environments where changes involve dependencies prefer language-based solutions. Finally, a model-based approach is ideal for large systems where the underlying service design is affected by the deployment. This is mirrored in terms of configuration [@talwar:comparison-of-approaches-to-service-deployment:2005, p. 9].

In summary, there are multiple areas to look at in future research related to cloud computing and microservices. Perhaps most prevalent is the need for an evaluation of various strategies and tools for Deployment Automation. One way to approach this can be development of tools for _quantitative_ comparison of Deployment Automation strategies. Looking at deployment configuration as source code allows using techniques from software engineering for this evaluation.

Armour (2004 loc. 427 and passim) stated that a software system is not in itself a product, but a container for knowledge; code is, indeed, executable knowledge. While his focus is on domain knowledge as it lives within software systems, it is possible to apply this idea to any code, as Spinellis (2012) points out: code is an executable specification, so expressive and concise code is self-documenting in a way that never rots.

Another of Talwar, Wu, et al. (2005, 9)’s key findings is that maintainability and documentability are proportional to the number of LOC, and that the number of steps and LOC are both reduced with the introduction of more sophisticated deployment tools.

## Continuous Delivery and DevOps

Continuous Delivery (CD) can be said to be a combination of two different ideas [@virmani:2015, p.79]:

- Continuous Integration (CI), the practise of integrating changes into the mainline early (e.g., master branch if the team uses Git for version control); and
- Continuous Deployment, the practise of deploying changes to the end users as soon as they make it into the mainline.

Putting these together renders a development workflow where developers frequently merge their changes into the production-ready version of the code base, and those changes are immediately deployed to the end users. This way of developing may introduce a need for feature management such as blue/green deployment[^blue-green-deployment] and/or canary release[^canary-release].

Continuous Delivery is only a part of a deployment strategy, but deserves its own discussion because of its potential organisational impact. With a monolithic architecture it may be possible to have a dedicated operations (Ops) team and still deploy new features and fixes to the end users somewhat continuously as the team will only have to deal with a single artefact. Even if they need to deploy it multiple times per day, tools can be developed to quickly verify and deploy the artefact. In a microservice context, however, with multiple services and teams each selecting their own technology stacks and deployment habits, it will likely be unfeasible for a dedicated operations team to manually verify and deploy each service as it receives changes. Furthermore, having to provide the Ops team with a production-ready package for them to verify and deploy whenever a change is made to the code base introduces unnecessary overhead for the development teams. This requires an organisational shift of deployment responsibility known as DevOps [e.g., @cois:modern-devops:2014].

## Measuring Continuous Delivery of microservices

There have been several studies specifically measuring the quality of a deployment pipeline (e.g., @talwar:comparison-of-approaches-to-service-deployment:2005; @castro:evaluating:2015; @feitelson:at-facebook:2013), some concerned with only a specific part of the pipeline (e.g., @spinellis:by-hand:2012; @chen:continuous-delivery:2015). Given that deployment configuration is indeed code, it becomes relevant to look to metrics designed to measure code quality in general (e.g., @bass-clements-kazman:software-architecture-in-practice:2013 with regard to architecture).

@chen:architecting-for-cd:2015 introduces the concept of Architecturally Significant Requirements, referring to the architectural requirements imposed upon the service itself by the deployment strategy. 

One important factor described by @chen:architecting-for-cd:2015 is which Architecturally Significant Requirements (ASRs) the deployment strategy imposes on the project. While Chen considers architecting for Continuous Delivery in a broad sense, different strategies will impose fewer or more ASRs of differing types on the code base of the actual service. More ASRs can make the transition to a Continuous Delivery set-up more difficult, more time consuming, and thus more expensive.

One particular ASR is considered by @addo:automatic-failover:2014, who describe an architecture for automatically routing traffic to other cloud providers if one fails. This points back to the CAP theorem, and raises the question of how to replicate data and ensure consistency across multiple providers.

## Summary

First, provisioning and maintaining the microservice runtime is a key concern. It ties in with the known CAP theorem, stating that consistency, availability, and partition tolerance is an unfeasible goal.

Second, cloud computing is an important factor when discussing microservices, as many of the key advantages of a microservice architecture come into play when computing resources are virtually unlimited. A system of microservices naturally requires more resources such as CPU and RAM than a monolithic system, as the microservice-based system comprises multiple runtimes and databases. If computing resources are not limited, however, this isolation allows both scaling and deployment of independent services. This has become a realistic scenario due to the rise of cloud providers.

Third, the deployment regime in the organisation plays a large role in the selection of a deployment strategy. It is essential to draw a parallel between how often the organisation _wishes_ to deploy changes to the end users, and how often the infrastructure _allows_ deployment. Automating the process takes work and introduces a learning curve, so the deployment pipeline should be tailored to suit the organisation's needs.

Fourth, the expressiveness and readability of the code that specifies the deployment strategy is a key factor in cutting the learning curve for the deployment strategy. As the configuration code grows, its quality can be measured using tools from the software engineering field---not just deployment.

Fifth, selecting a deployment strategy may have a significant organisational impact. For example, introducing DevOps to enable Continuous Delivery in an organisation that previously had a centralised team responsible for deployments requires the organisation to distribute these responsibilities to the developers, and possibly introduce new roles. In a sizeable organisation, this distribution of responsibility can be challenging: it affects the workflow of everyone responsible for the development, ranging from developers to managers. DevOps also affects processes for identifying and resolving problems with the software.

Last, there are multiple ways of measuring quality of deployment approaches. In particular, Architecturally Significant Requirements of the deployment strategy may require so many changes to the existing code base that the strategy is unfeasible for the organisation.
