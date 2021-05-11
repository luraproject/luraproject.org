---
title: "The Lura Project"
description: "An extendable, simple and **stateless high-performance API Gateway framework** designed for both cloud-native and on-prem setups"
---

# What is the Lura Project

Consumers of REST API content (specially in microservices) often query backend services that weren't coded for the UI implementation. This is of course a good practice, but the UI consumers need to do implementations that suffer a lot of complexity and burden with the sizes of their microservices responses.

Lura is an **API Gateway** builder and proxy generator that sits between the client and all the source servers, adding a new layer that removes all the complexity to the clients, providing them only the information that the UI needs. Lura acts as an **aggregator** of many sources into single endpoints and allows you to group, wrap, transform and shrink responses. Additionally it supports a myriad of middlewares and plugins that allow you to extend the functionality, such as adding Oauth authorization or security layers.

Lura not only supports HTTP(S), but because it is a set of generic libraries you can build all type of API Gateways and proxies, including for instance, a RPC gateway.

## Practical Example

A mobile developer needs to construct a single front page that requires data from 4 different calls to their backend services, e.g:

    1) api.store.server/products
    2) api.store.server/marketing-promos
    3) api.users.server/users/{id_user}
    4) api.users.server/shopping-cart/{id_user}

The screen is very simple and the mobile client _only_ needs to retrieve data from 4 different sources, wait for the round trip and then hand pick only a few fields from the response.

What if the mobile could call a single endpoint?

    1) lura.server/frontpage/{id_user}

That's something Lura can do for you. And this is how it would look like:

![Gateway](images/docs/lura-gateway.png)

Lura would merge all the data and return only the fields you need (the difference in size in the graph).

Visit the [the repository](https://github.com/luraproject/lura) for more information and documentation.

---

# Lura Technical Charter

You can download the Technical Charter here: 📄 "[The Technical Charter for Lura Project a Series of LF Projects, LLC](/pdf/Lura-Technical-Charter-v1.pdf)".

This document was adopted on April 14, 2021 and cover the following topics:

1. Mission and Scope of the Project
2. Technical Steering Committee
3. TSC Voting
4. Compliance with Policies
5. Community Assets
6. General Rules and Operations
7. Intellectual Property Policy

---
