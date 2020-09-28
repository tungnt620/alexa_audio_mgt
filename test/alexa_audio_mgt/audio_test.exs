defmodule AlexaAudioMgt.AudioTest do
  use AlexaAudioMgt.DataCase

  alias AlexaAudioMgt.Audio

  describe "media" do
    alias AlexaAudioMgt.Audio.Media

    @valid_attrs %{link: "some link", mp3_link: "some mp3_link"}
    @update_attrs %{link: "some updated link", mp3_link: "some updated mp3_link"}
    @invalid_attrs %{link: nil, mp3_link: nil}

    def media_fixture(attrs \\ %{}) do
      {:ok, media} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Audio.create_media()

      media
    end

    test "list_media/0 returns all media" do
      media = media_fixture()
      assert Audio.list_media() == [media]
    end

    test "get_media!/1 returns the media with given id" do
      media = media_fixture()
      assert Audio.get_media!(media.id) == media
    end

    test "create_media/1 with valid data creates a media" do
      assert {:ok, %Media{} = media} = Audio.create_media(@valid_attrs)
      assert media.link == "some link"
      assert media.mp3_link == "some mp3_link"
    end

    test "create_media/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Audio.create_media(@invalid_attrs)
    end

    test "update_media/2 with valid data updates the media" do
      media = media_fixture()
      assert {:ok, %Media{} = media} = Audio.update_media(media, @update_attrs)
      assert media.link == "some updated link"
      assert media.mp3_link == "some updated mp3_link"
    end

    test "update_media/2 with invalid data returns error changeset" do
      media = media_fixture()
      assert {:error, %Ecto.Changeset{}} = Audio.update_media(media, @invalid_attrs)
      assert media == Audio.get_media!(media.id)
    end

    test "delete_media/1 deletes the media" do
      media = media_fixture()
      assert {:ok, %Media{}} = Audio.delete_media(media)
      assert_raise Ecto.NoResultsError, fn -> Audio.get_media!(media.id) end
    end

    test "change_media/1 returns a media changeset" do
      media = media_fixture()
      assert %Ecto.Changeset{} = Audio.change_media(media)
    end
  end
end
