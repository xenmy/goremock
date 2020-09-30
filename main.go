/*
 * goremock
 *
 * An API moch for *oreore server.
 *
 * API version: 0.1.0
 * Generated by: OpenAPI Generator (https://openapi-generator.tech)
 */

package main

import (
	"fmt"
	"log"

	// WARNING!
	// Change this to a fully-qualified import path
	// once you place this file into your project.
	// For example,
	//
	//    sw "github.com/myname/myrepo/go"
	//
	sw "./go"
	"github.com/NezyMaky/goremoch/config"
)

var Config *config.Config

func main() {
	Config := config.NewConfFromEnv()

	log.Printf("Server started")

	router := sw.NewRouter()

	log.Fatal(router.Run(fmt.Sprintf(":%d", Config.Port)))
}
