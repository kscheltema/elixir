defmodule Discuss.DiscussionTest do
  use Discuss.DataCase

  alias Discuss.Discussion

  describe "posts" do
    alias Discuss.Discussion.Posts

    import Discuss.DiscussionFixtures

    @invalid_attrs %{content: nil, title: nil}

    test "list_posts/0 returns all posts" do
      posts = posts_fixture()
      assert Discussion.list_posts() == [posts]
    end

    test "get_posts!/1 returns the posts with given id" do
      posts = posts_fixture()
      assert Discussion.get_posts!(posts.id) == posts
    end

    test "create_posts/1 with valid data creates a posts" do
      valid_attrs = %{content: "some content", title: "some title"}

      assert {:ok, %Posts{} = posts} = Discussion.create_posts(valid_attrs)
      assert posts.content == "some content"
      assert posts.title == "some title"
    end

    test "create_posts/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Discussion.create_posts(@invalid_attrs)
    end

    test "update_posts/2 with valid data updates the posts" do
      posts = posts_fixture()
      update_attrs = %{content: "some updated content", title: "some updated title"}

      assert {:ok, %Posts{} = posts} = Discussion.update_posts(posts, update_attrs)
      assert posts.content == "some updated content"
      assert posts.title == "some updated title"
    end

    test "update_posts/2 with invalid data returns error changeset" do
      posts = posts_fixture()
      assert {:error, %Ecto.Changeset{}} = Discussion.update_posts(posts, @invalid_attrs)
      assert posts == Discussion.get_posts!(posts.id)
    end

    test "delete_posts/1 deletes the posts" do
      posts = posts_fixture()
      assert {:ok, %Posts{}} = Discussion.delete_posts(posts)
      assert_raise Ecto.NoResultsError, fn -> Discussion.get_posts!(posts.id) end
    end

    test "change_posts/1 returns a posts changeset" do
      posts = posts_fixture()
      assert %Ecto.Changeset{} = Discussion.change_posts(posts)
    end
  end
end
