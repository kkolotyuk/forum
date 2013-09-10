object @topic
attributes :id, :title

child :messages do
  attributes :id, :content
end