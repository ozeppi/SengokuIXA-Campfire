mongoose =  require 'mongoose'

Camp = new mongoose.Schema(
    namespace: String
    x: Number
    y: Number
    user: String
)
Camp.index({namespace: 1, x:1, y:1}, {unique:true})

module.exports = mongoose.model 'Camp', Camp
