---
header_brand: "The Lura Project"
header_tagline_paragraph: "An extendable, simple and **stateless high-performance API Gateway framework** designed for both cloud-native and on-prem setups"
header_button_cta:
  url: "#download"
  title: "Download the framework ▼"
header_button_more:
  url: "#what-is-the-lura-project"
  title: "Read the Docs"
teaser_image: "images/lura-logo-header.png"
---

# What is The Lura Project

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

Visit the [the repository](https://github.com/devopsfaith/krakend) for more information and documentation.

---

## Library Usage

Lura is presented as a **go library** that you can include in your own go application to build a powerful proxy or API gateway. In order to get you started several examples of implementations are included in the `examples` folder.

Of course you will need [golang installed](https://golang.org/doc/install) in your system to compile the code.

A ready to use example:

```go
    package main

    import (
        "flag"
        "log"
        "os"

        "github.com/devopsfaith/krakend/config"
        "github.com/devopsfaith/krakend/logging"
        "github.com/devopsfaith/krakend/proxy"
        "github.com/devopsfaith/krakend/router/gin"
    )

    func main() {
        port := flag.Int("p", 0, "Port of the service")
        logLevel := flag.String("l", "ERROR", "Logging level")
        debug := flag.Bool("d", false, "Enable the debug")
        configFile := flag.String("c", "/etc/krakend/configuration.json", "Path to the configuration filename")
        flag.Parse()

        parser := config.NewParser()
        serviceConfig, err := parser.Parse(*configFile)
        if err != nil {
            log.Fatal("ERROR:", err.Error())
        }
        serviceConfig.Debug = serviceConfig.Debug || *debug
        if *port != 0 {
            serviceConfig.Port = *port
        }

        logger, _ := logging.NewLogger(*logLevel, os.Stdout, "[KRAKEND]")

        routerFactory := gin.DefaultFactory(proxy.DefaultFactory(logger), logger)

        routerFactory.New().Run(serviceConfig)
    }
```

Visit the [framework overview](https://github.com/devopsfaith/krakend/blob/master/docs/OVERVIEW.md) for more details about the components of the Lura.

---

# Lura Technical Charter

You can download the Technical Charter here: 📄 "[The Technical Charter for Lura Project a Series of LF Projects, LLC](docs/Lura%20Technical%20Charter%20v1.pdf)".

This document was adopted on April 14, 2021 and cover the following topics:

1. Mission and Scope of the Project
2. Technical Steering Committee
3. TSC Voting
4. Compliance with Policies
5. Community Assets
6. General Rules and Operations
7. Intellectual Property Policy

---
