variable "name"{
    type = string
    description = "The App Access Count Name for the Cloudwatch"
}

variable "logname"{
    type = string
    description = "MyApp/access.log"
}

variable "metric_name" {
    type = string
    description = "The metric name"
}