if Meteor.isClient

	brain = require \brain.js
	@state = {}

	@encode = -> it.split('')map -> it.charCodeAt(0) / 256

	processTrainingData = -> it.map ->
		input: encode it.input
		output: it.output

	train = (data) ->
		net = new brain.NeuralNetwork!
		net.train processTrainingData data
		state.trainedNet = net.toFunction!

	execute = (input) ->
		state.trainedNet encode input

	train trainingData
	console.log execute 'This cat is lovely cute'
