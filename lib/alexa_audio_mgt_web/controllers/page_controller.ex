defmodule AlexaAudioMgtWeb.PageController do
  use AlexaAudioMgtWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
