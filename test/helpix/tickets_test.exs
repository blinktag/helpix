defmodule Helpix.TicketsTest do
  use Helpix.DataCase

  alias Helpix.Tickets

  describe "ticket" do
    alias Helpix.Tickets.Ticket

    @valid_attrs %{body: "some body", department_id: 42, last_replier: "some last_replier", status: 42, subject: "some subject", user_id: 42}
    @update_attrs %{body: "some updated body", department_id: 43, last_replier: "some updated last_replier", status: 43, subject: "some updated subject", user_id: 43}
    @invalid_attrs %{body: nil, department_id: nil, last_replier: nil, status: nil, subject: nil, user_id: nil}

    def ticket_fixture(attrs \\ %{}) do
      {:ok, ticket} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tickets.create_ticket()

      ticket
    end

    test "list_ticket/0 returns all ticket" do
      ticket = ticket_fixture()
      assert Tickets.list_ticket() == [ticket]
    end

    test "get_ticket!/1 returns the ticket with given id" do
      ticket = ticket_fixture()
      assert Tickets.get_ticket!(ticket.id) == ticket
    end

    test "create_ticket/1 with valid data creates a ticket" do
      assert {:ok, %Ticket{} = ticket} = Tickets.create_ticket(@valid_attrs)
      assert ticket.body == "some body"
      assert ticket.department_id == 42
      assert ticket.last_replier == "some last_replier"
      assert ticket.status == 42
      assert ticket.subject == "some subject"
      assert ticket.user_id == 42
    end

    test "create_ticket/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tickets.create_ticket(@invalid_attrs)
    end

    test "update_ticket/2 with valid data updates the ticket" do
      ticket = ticket_fixture()
      assert {:ok, %Ticket{} = ticket} = Tickets.update_ticket(ticket, @update_attrs)
      assert ticket.body == "some updated body"
      assert ticket.department_id == 43
      assert ticket.last_replier == "some updated last_replier"
      assert ticket.status == 43
      assert ticket.subject == "some updated subject"
      assert ticket.user_id == 43
    end

    test "update_ticket/2 with invalid data returns error changeset" do
      ticket = ticket_fixture()
      assert {:error, %Ecto.Changeset{}} = Tickets.update_ticket(ticket, @invalid_attrs)
      assert ticket == Tickets.get_ticket!(ticket.id)
    end

    test "delete_ticket/1 deletes the ticket" do
      ticket = ticket_fixture()
      assert {:ok, %Ticket{}} = Tickets.delete_ticket(ticket)
      assert_raise Ecto.NoResultsError, fn -> Tickets.get_ticket!(ticket.id) end
    end

    test "change_ticket/1 returns a ticket changeset" do
      ticket = ticket_fixture()
      assert %Ecto.Changeset{} = Tickets.change_ticket(ticket)
    end
  end
end
