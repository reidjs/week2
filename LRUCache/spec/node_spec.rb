require 'node'
require 'rspec'
require 'byebug'

RSpec.describe Node do
  subject(:node) { Node.new(1) }

  describe "#initialize" do
    it "initializes by itself w/ no references if no args provided" do
      expect(node.next).to be nil
      expect(node.prev).to be nil
    end
    it "inits with value" do
      expect(node.val).to eq(1)
    end
  end
  describe "#insert_after" do
    before(:each) do
      let(:inserted_node) { Node.new(2, node) } 
    end
    # subject(:node) { Node.new(1) }
    # let(:inserted_node) { Node.new(2, node) } #can :inserted_node access :node?
    it "inserts node AFTER given node if provided in argument" do
      # node2 = Node.new(1)
      # inserted_node = Node.new(2, node)
      # byebug

      expect(node.next.val).to eq(inserted_node.val)

      # expect(node.next.val).to eq(2)
    end
    it "sets the inserted nodes @prev as a ref to its parent" do
      # expect(inserted_node.prev).to eq(node)
    end
  end
end
