module Fog
  module AWS
    module ELB
      class Real

        # Register an instance with an existing ELB
        #
        # ==== Parameters
        # * instance_ids<~Array> - List of instance IDs to associate with ELB
        # * lb_name<~String> - Load balancer to assign instances to
        #
        # ==== Returns
        # * response<~Excon::Response>:
        #   * body<~Hash>:
        #     * 'requestId'<~String> - Id of request
        #     * 'return'<~Boolean> - success?
        def register_instances_with_load_balancer(instance_ids, lb_name)
          params = ELB.indexed_param('Instances.member.%.InstanceId', [*instance_ids], 1)
          request({
            'Action'           => 'RegisterInstancesWithLoadBalancer',
            'LoadBalancerName' => lb_name,
            :parser            => Fog::Parsers::AWS::ELB::RegisterInstancesWithLoadBalancer.new
          }.merge!(params))
        end

        alias :register_instances :register_instances_with_load_balancer

      end

      class Mock

        def register_instances_with_load_balancer(lb_name = [])
          raise MockNotImplemented.new("Contributions welcome!")
        end

        alias :register_instances :register_instances_with_load_balancer

      end

    end
  end
end