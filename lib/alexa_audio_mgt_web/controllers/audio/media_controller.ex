defmodule AlexaAudioMgtWeb.Audio.MediaController do
  use AlexaAudioMgtWeb, :controller

  alias AlexaAudioMgt.Audio
  alias AlexaAudioMgt.Audio.Media

  def index(conn, _params) do
    media = Audio.list_media()
    render(conn, "index.html", media: media)
  end

  def new(conn, _params) do
    changeset = Audio.change_media(%Media{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"media" => media_params}) do
    case Audio.create_media(media_params) do
      {:ok, media} ->
        conn
        |> put_flash(:info, "Media created successfully.")
        |> redirect(to: Routes.audio_media_path(conn, :show, media))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    media = Audio.get_media!(id)
    render(conn, "show.html", media: media)
  end

  def edit(conn, %{"id" => id}) do
    media = Audio.get_media!(id)
    changeset = Audio.change_media(media)
    render(conn, "edit.html", media: media, changeset: changeset)
  end

  def update(conn, %{"id" => id, "media" => media_params}) do
    media = Audio.get_media!(id)

    case Audio.update_media(media, media_params) do
      {:ok, media} ->
        conn
        |> put_flash(:info, "Media updated successfully.")
        |> redirect(to: Routes.audio_media_path(conn, :show, media))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", media: media, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    media = Audio.get_media!(id)
    {:ok, _media} = Audio.delete_media(media)

    conn
    |> put_flash(:info, "Media deleted successfully.")
    |> redirect(to: Routes.audio_media_path(conn, :index))
  end
end
