require 'spec_helper'

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

describe HealthRecordsController do

  # This should return the minimal set of attributes required to create a valid
  # HealthRecord. As you add validations to HealthRecord, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "date" => "2013-10-04", time_period: 1, health: 2 } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # HealthRecordsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all health_records as @health_records" do
      health_record = HealthRecord.create! valid_attributes
      get :index, {}, valid_session
      assigns(:health_records).should eq([health_record])
    end
  end

  describe "GET show" do
    it "assigns the requested health_record as @health_record" do
      health_record = HealthRecord.create! valid_attributes
      get :show, {:id => health_record.to_param}, valid_session
      assigns(:health_record).should eq(health_record)
    end
  end

  describe "GET new" do
    it "assigns a new health_record as @health_record" do
      get :new, {}, valid_session
      assigns(:health_record).should be_a_new(HealthRecord)
    end
  end

  describe "GET edit" do
    it "assigns the requested health_record as @health_record" do
      health_record = HealthRecord.create! valid_attributes
      get :edit, {:id => health_record.to_param}, valid_session
      assigns(:health_record).should eq(health_record)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new HealthRecord" do
        expect {
          post :create, {:health_record => valid_attributes}, valid_session
        }.to change(HealthRecord, :count).by(1)
      end

      it "assigns a newly created health_record as @health_record" do
        post :create, {:health_record => valid_attributes}, valid_session
        assigns(:health_record).should be_a(HealthRecord)
        assigns(:health_record).should be_persisted
      end

      it "redirects to the created health_record" do
        post :create, {:health_record => valid_attributes}, valid_session
        response.should redirect_to(HealthRecord.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved health_record as @health_record" do
        # Trigger the behavior that occurs when invalid params are submitted
        HealthRecord.any_instance.stub(:save).and_return(false)
        post :create, {:health_record => { "date" => "invalid value" }}, valid_session
        assigns(:health_record).should be_a_new(HealthRecord)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        HealthRecord.any_instance.stub(:save).and_return(false)
        post :create, {:health_record => { "date" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end

    context "料理を追加した場合" do
      before do
        @eatings = build_list(:eating, 3, health_record: nil)
      end

      let(:parameters) {
        {
          date: Time.now.strftime("%Y-%m-%d"), time_period: 1, health: 1,
          eatings_attributes: @eatings.map do |r|
            { food_id: r.food_id, amount: r.amount }
          end
        }
      }

      context "パラメータに不備がない場合" do
        it "HealthRecordに紐付いた食べた料理が追加されること" do
          post :create, { health_record: parameters }, valid_session
          expect(assigns(:health_record).eating_ids).to have(3).items
        end
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested health_record" do
        health_record = HealthRecord.create! valid_attributes
        # Assuming there are no other health_records in the database, this
        # specifies that the HealthRecord created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        HealthRecord.any_instance.should_receive(:update).with({ "date" => "2013-10-04" })
        put :update, {:id => health_record.to_param, :health_record => { "date" => "2013-10-04" }}, valid_session
      end

      it "assigns the requested health_record as @health_record" do
        health_record = HealthRecord.create! valid_attributes
        put :update, {:id => health_record.to_param, :health_record => valid_attributes}, valid_session
        assigns(:health_record).should eq(health_record)
      end

      it "redirects to the health_record" do
        health_record = HealthRecord.create! valid_attributes
        put :update, {:id => health_record.to_param, :health_record => valid_attributes}, valid_session
        response.should redirect_to(health_record)
      end
    end

    describe "with invalid params" do
      it "assigns the health_record as @health_record" do
        health_record = HealthRecord.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        HealthRecord.any_instance.stub(:save).and_return(false)
        put :update, {:id => health_record.to_param, :health_record => { "date" => "invalid value" }}, valid_session
        assigns(:health_record).should eq(health_record)
      end

      it "re-renders the 'edit' template" do
        health_record = HealthRecord.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        HealthRecord.any_instance.stub(:save).and_return(false)
        put :update, {:id => health_record.to_param, :health_record => { "date" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end

    context "料理が選択されている場合" do
      let(:parameters) {
        {
          id: @health_record.to_param,
          health_record: valid_attributes.merge(
            eatings_attributes: @eatings.map { |r| r.attributes }
          )
        }
      }

      context "食べた料理のvalidateに問題がない場合" do
        before do
          @eatings = build_list(:eating, 3, health_record: nil)
          @health_record = create(:health_record)
        end

        it "redirects to the health_record" do
          put :update, parameters, valid_session
          expect(response).to redirect_to(@health_record)
          expect(assigns(:health_record).eatings.size).to eq(3)
        end
      end

      context "食べた料理のvalidateに問題がある場合" do
        before do
          @eatings = build_list(:eating, 3, health_record: nil, food_id: nil)
          @health_record = create(:health_record)
        end

        it "redirects to the health_record" do
          put :update, parameters, valid_session
          expect(response).to render_template("edit")
        end
      end

      context "食べた料理のvalidateに問題があるなし混在の場合" do
        before do
          @eatings = build_list(:eating, 3, health_record: nil, food_id: nil) +
            build_list(:eating, 3, health_record: nil)
          @health_record = create(:health_record)
        end

        it "redirects to the health_record" do
          put :update, parameters, valid_session
          expect(response).to render_template("edit")
        end
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested health_record" do
      health_record = HealthRecord.create! valid_attributes
      expect {
        delete :destroy, {:id => health_record.to_param}, valid_session
      }.to change(HealthRecord, :count).by(-1)
    end

    it "redirects to the health_records list" do
      health_record = HealthRecord.create! valid_attributes
      delete :destroy, {:id => health_record.to_param}, valid_session
      response.should redirect_to(health_records_url)
    end
  end

  describe "GET new_eating" do
    context "存在する料理を指定した場合" do
      before do
        @food = create(:food)
      end

      it "new_eating viewにeatingが追加されること" do
        get :new_eating, format: :coffee, name: @food.name
        expect(assigns(:eating).food).to eq(@food)
        expect(response).to render_template(:new_eating)
      end
    end

    context "存在しない料理を指定した場合" do
      it "eatingが作られず、エラーテンプレートにとばされること" do
        get :new_eating, format: :coffee, name: :hoge
        expect(assigns(:eating)).to be_nil
        expect(response).to render_template(partial: "_food_not_found")
      end
    end
  end
end
