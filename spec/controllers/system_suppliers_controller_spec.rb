require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe SystemSuppliersController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # SystemSupplier. As you add validations to SystemSupplier, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SystemSuppliersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all system_suppliers as @system_suppliers" do
      system_supplier = SystemSupplier.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:system_suppliers)).to eq([system_supplier])
    end
  end

  describe "GET #show" do
    it "assigns the requested system_supplier as @system_supplier" do
      system_supplier = SystemSupplier.create! valid_attributes
      get :show, {:id => system_supplier.to_param}, valid_session
      expect(assigns(:system_supplier)).to eq(system_supplier)
    end
  end

  describe "GET #new" do
    it "assigns a new system_supplier as @system_supplier" do
      get :new, {}, valid_session
      expect(assigns(:system_supplier)).to be_a_new(SystemSupplier)
    end
  end

  describe "GET #edit" do
    it "assigns the requested system_supplier as @system_supplier" do
      system_supplier = SystemSupplier.create! valid_attributes
      get :edit, {:id => system_supplier.to_param}, valid_session
      expect(assigns(:system_supplier)).to eq(system_supplier)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new SystemSupplier" do
        expect {
          post :create, {:system_supplier => valid_attributes}, valid_session
        }.to change(SystemSupplier, :count).by(1)
      end

      it "assigns a newly created system_supplier as @system_supplier" do
        post :create, {:system_supplier => valid_attributes}, valid_session
        expect(assigns(:system_supplier)).to be_a(SystemSupplier)
        expect(assigns(:system_supplier)).to be_persisted
      end

      it "redirects to the created system_supplier" do
        post :create, {:system_supplier => valid_attributes}, valid_session
        expect(response).to redirect_to(SystemSupplier.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved system_supplier as @system_supplier" do
        post :create, {:system_supplier => invalid_attributes}, valid_session
        expect(assigns(:system_supplier)).to be_a_new(SystemSupplier)
      end

      it "re-renders the 'new' template" do
        post :create, {:system_supplier => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested system_supplier" do
        system_supplier = SystemSupplier.create! valid_attributes
        put :update, {:id => system_supplier.to_param, :system_supplier => new_attributes}, valid_session
        system_supplier.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested system_supplier as @system_supplier" do
        system_supplier = SystemSupplier.create! valid_attributes
        put :update, {:id => system_supplier.to_param, :system_supplier => valid_attributes}, valid_session
        expect(assigns(:system_supplier)).to eq(system_supplier)
      end

      it "redirects to the system_supplier" do
        system_supplier = SystemSupplier.create! valid_attributes
        put :update, {:id => system_supplier.to_param, :system_supplier => valid_attributes}, valid_session
        expect(response).to redirect_to(system_supplier)
      end
    end

    context "with invalid params" do
      it "assigns the system_supplier as @system_supplier" do
        system_supplier = SystemSupplier.create! valid_attributes
        put :update, {:id => system_supplier.to_param, :system_supplier => invalid_attributes}, valid_session
        expect(assigns(:system_supplier)).to eq(system_supplier)
      end

      it "re-renders the 'edit' template" do
        system_supplier = SystemSupplier.create! valid_attributes
        put :update, {:id => system_supplier.to_param, :system_supplier => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested system_supplier" do
      system_supplier = SystemSupplier.create! valid_attributes
      expect {
        delete :destroy, {:id => system_supplier.to_param}, valid_session
      }.to change(SystemSupplier, :count).by(-1)
    end

    it "redirects to the system_suppliers list" do
      system_supplier = SystemSupplier.create! valid_attributes
      delete :destroy, {:id => system_supplier.to_param}, valid_session
      expect(response).to redirect_to(system_suppliers_url)
    end
  end

end