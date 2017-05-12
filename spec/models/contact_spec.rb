require 'rails_helper'

describe Contact do
  #名前とemailとcontentがあれば有効な状態であること
  it "is valid with name email content" do
    contact = Contact.new(name: '沢辺', email: 'hiphop@example.com', content: 'aaaaaa')
    expect(contact).to be_valid
  end

  #nameなければ無効であること
  it "is invalid without a name" do
    contact = Contact.new(email: 'hiphop@example.com', content: 'aaaaaa')
    expect(contact).not_to be_valid
  end

  #emailなければ無効であること
  it "is invalid without a email" do
    contact = Contact.new(name: 'yasu', content: 'aaaaaa')
    expect(contact).not_to be_valid
  end

  #contentなければ無効であること
  it "is invalid without a content" do
    contact = Contact.new( name: 'aaaaaa',email: 'hiphop@example.com',)
    expect(contact).not_to be_valid
  end


  #nameがなければ無効であること
  it "is valid with name" do
    contact = Contact.new
    contact.valid?
    expect(contact.errors[:name]).to include("を入力してください")
  end

  #emailがなければ無効
  it "is valid with email" do
    contact = Contact.new
    contact.valid?
    expect(contact.errors[:email]).to include("を入力してください")
  end

  #contentがなければ無効
  it "is valid with content" do
    contact = Contact.new
    contact.valid?
    expect(contact.errors[:content]).to include("を入力してください")
  end
end
