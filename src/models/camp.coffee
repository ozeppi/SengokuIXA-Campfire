mongoose =  require 'mongoose'

Camp = new mongoose.Schema(
    namespace: String
    x: Number
    y: Number
    user: String
)

module.exports = mongoose.model 'Camp', Camp
