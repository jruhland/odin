defmodule Odin.SessionView do
  use Odin.Web, :view

  def render("index.json", %{sessions: sessions}) do
    %{data: render_many(sessions, Odin.SessionView, "session.json")}
  end

  def render("show.json", %{session: session}) do
    %{data: render_one(session, Odin.SessionView, "session.json")}
  end

  def render("session.json", %{session: session}) do
    %{id: session.id}
  end
end
