package config

import (
	"github.com/kelseyhightower/envconfig"
)

type Config struct {
	Port int `envconfig:"OROR_PORT" default:3000`
}

func NewConfFromEnv() *Config {
	var c Config
	envconfig.Process("", &c)

	return &c
}
