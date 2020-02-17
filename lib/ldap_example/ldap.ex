defmodule LdapExample.Ldap do
	def authenticate(uid, password) do
		{:ok, ldap_conn} = Exldap.open
		bind = "uid=#{uid},dc=example,dc=com"
		case Exldap.verify_credentials(ldap_conn, bind, password) do
		  :ok -> :ok
		  _ -> {:error, "Invalid username / password"}
		end
	  end
	
	  def get_by_uid(uid) do
		{:ok, ldap_conn} = Exldap.connect
		{:ok, search_results} = Exldap.search_field(ldap_conn, "uid", uid)
		case search_results do
		  [] -> {:error, "Could not find user with uid #{uid}"}
		  _ -> search_results |> Enum.fetch(0)
		end
	  end
	
	  def to_map(entry) do
		username = Exldap.search_attributes(entry, "uid")
		name = Exldap.search_attributes(entry, "cn")
		email = Exldap.search_attributes(entry, "mail")
		%{username: username, name: name, email: email}
	  end
end
