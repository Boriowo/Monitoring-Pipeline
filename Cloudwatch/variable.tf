variable "name"{
    type = string
    description = "The App Access Count Name for the Cloudwatch"
}

variable "logname"{
    type = string
    source = "MyApp/access.log"
    description = "The Log group name"
}