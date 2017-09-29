# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
simplemde = null

cleanupSimpleMDE = ->
	if simplemde?
		simplemde.toTextArea()
		simplemde = null

$(window).on 'popstate', cleanupSimpleMDE
$(document).on 'turbolinks:before-visit', cleanupSimpleMDE

$(document).on "turbolinks:load", ->
	simplemde = new SimpleMDE()

# 这里主要其作用的就是最后一句new SimpleMDE(),它的原理就是寻找页面上第一个textarea然后对其进行美化并加工成一个Markdown编辑器
# 其它的代码都是为了防止其与turbolinks冲突而存在的
