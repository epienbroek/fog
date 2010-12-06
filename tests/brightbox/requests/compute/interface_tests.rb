Shindo.tests('Brightbox::Compute | interface requests', ['brightbox']) do

  tests('success') do

    server = Brightbox[:compute].servers.first
    @interface_id = server.interfaces.first["id"]
    tests("#get_interface('#{@interface_id}')").formats(Brightbox::Compute::Formats::Full::INTERFACE) do
      Brightbox[:compute].get_interface(@interface_id)
    end

  end

  tests('failure') do

    tests("#get_interface('int-00000')").raises(Excon::Errors::Forbidden) do
      Brightbox[:compute].get_interface('int-00000')
    end

    tests("#get_interface()").raises(ArgumentError) do
      Brightbox[:compute].get_interface()
    end
  end

end
