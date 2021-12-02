# Action Network Developer Operations and Security Engineer Take Home Assignment

This take home assignment is designed to allow you to demonstrate DevOps and security skills.

## Expectations and Deliverables

Our expectations are:

* There is no time limit or due date, though we expect this may take at least a couple days to accomplish and test. An honorarium will be provided as compensation for this work, paid upon receipt of the deliverables outlined below.
* This is a skills test and a way to demonstrate your talents, so we do not expect the finished product to be production ready. Loose ends, hard coded things, hacks to save time, all acceptable, though bonus points if you highlight those in your code and your writeup and talk through a bit how you'd make them production ready.
* That said, we do expect to be able to run your work ourselves to see what you've done and how it functions.
* Your work should be licensed in a way that allows us to examine the code you wrote and run it so we can test out its functions for the purposes of our hiring process. We do not need ownership or the right to run it in production, though a permissive open source license like MIT would be fine here too.

Your deliverables are:

* A repository on GitHub (public or private) with your work, accomplishing the goals set out in the instructions below. Feel free to fork this repository if you'd like.
* A writeup (including diagrams if desired) of your infrastructure and setup. (Can be a readme type file in the repository if you want.)
* Instructions for how to run your code ourselves and demonstrate the features, including any necessary services we need to sign up for, etc... (Can be a readme type file in the repository if you want.)

Overall, this project should demonstrate your skills in the DevOps and security realm, so please approach it in that spirit. It doesn't have to be perfect, and it doesn't have to be "right" or be free of bugs and the like. But it should demonstrate what you can do.

When you are finished, email a link to your repository, writeup, and instructions to your hiring contact. If you need our GitHub usernames to add to a private repository, we can provide those.

## Instructions and Goals

Your goal with this assignment is to write infrastructure as code that provisions a set of web servers in an auto scaling group behind a load balancer. (No need to set up a database or a full web application stack, though you can if you want.)

The auto scaling group should have 3 servers in it by default, with a max of 5 total, and scale and descale based on simulated load, so your work should have a way to manually simulate load or send some kind of scaling signal to cause scaling and descaling to happen.

The servers should serve a basic HTML page that says “Hello world” with the current date and time, at some kind of endpoint. This does not have to be a full website served at a domain name, it can be a load balancer URL of a cloud service for instance, or some other endpoint that requires some local tooling to view in a browser, as long as that's explained in the instructions.

Bonus points for zero manual config on boot. (This could all be accomplished with Terraform, Chef, Elasticbeanstalk, etc...)

In addition, write a method to automatically update or replace servers whenever a new security update for the operating system or installed packages is available (or perhaps on some kind of schedule, like nightly), making sure to test servers running the new configuration are alive and serving before putting them in to the load balancer.

Your setup should also take into account industry-standard security practices, including encryption in flight and at rest (feel free to use a self-signed certificates), no secrets checked into GitHub, etc...

We use Ruby on Rails, Linux (Ubuntu primarily), Chef or Elasticbeanstalk, Cloudformation, and AWS for our main stack, but feel free to implement on whatever stack you're most comfortable with.

If you have any questions as you go, please don't hesitate to reach out to your hiring contact.

Good luck! We're looking forward to seeing your work!
