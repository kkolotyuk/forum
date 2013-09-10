object @topic
attributes :id, :title

child :messages do
  extends 'messages/show'
end