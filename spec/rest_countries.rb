# frozen_string_literal: true

require 'rest_countries'
require 'rest_countries/client'
require 'rest_countries/version'

RSpec.describe RestCountries do
  let(:client) { RestCountries::Client.new }

  it "has a version number" do
    expect(RestCountries::VERSION).not_to be nil
  end

  it "returns a list of all countries" do
    response = client.all
    expect(response).to be_an_instance_of(Array)
    expect(response).not_to be_empty
  end

  it "returns a country details by name" do
    response = client.name('Philippines')
    expect(response).to be_an_instance_of(Array)
    expect(response).not_to be_empty
  end

  it "returns a country details by fullname" do
    response = client.fullname('Philippines')
    expect(response).to be_an_instance_of(Array)
    expect(response).not_to be_empty
  end

  it "returns a country details by alpha code" do
    response = client.code('ph')
    expect(response).to be_an_instance_of(Array)
    expect(response).not_to be_empty
  end

  it "returns countries by a list of alpha codes" do
    response = client.codes(['ph','co'])
    expect(response).to be_an_instance_of(Array)
    expect(response).not_to be_empty
  end

  it "returns a country details by currency code or name" do
    response = client.currency('php')
    expect(response).to be_an_instance_of(Array)
    expect(response).not_to be_empty
  end

  it "returns a country details by how a citizen is called" do
    response = client.demonym('filipino')
    expect(response).to be_an_instance_of(Array)
    expect(response).not_to be_empty
  end

  it "returns a country details by language code or name" do
    response = client.language('fil')
    expect(response).to be_an_instance_of(Array)
    expect(response).not_to be_empty
  end

  it "returns a country details by capital city" do
    response = client.capital('manila')
    expect(response).to be_an_instance_of(Array)
    expect(response).not_to be_empty
  end

  it "returns a country details by region" do
    response = client.region('asia')
    expect(response).to be_an_instance_of(Array)
    expect(response).not_to be_empty
  end

  it "returns a country details by subregion" do
    response = client.subregion('south-eastern')
    expect(response).to be_an_instance_of(Array)
    expect(response).not_to be_empty
  end

  it "returns a country details by any translation name" do
    response = client.translation('ara')
    expect(response).to be_an_instance_of(Array)
    expect(response).not_to be_empty
  end

  it "filter countries by specified fields" do
    response = client.filter('all',['name','capital','currency'])
    expect(response).to be_an_instance_of(Array)
    expect(response).not_to be_empty
  end
end
