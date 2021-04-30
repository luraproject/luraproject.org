---
title: "Documentation - Lura Project Open Source API Gateway"
date: 2019-03-26T08:47:11+01:00
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

Visit the [framework overview](https://github.com/devopsfaith/krakend/blob/master/docs/OVERVIEW.md) for more details about the components of the Lura project.
