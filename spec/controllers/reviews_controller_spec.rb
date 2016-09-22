require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do

  login_user

  # This should return the minimal set of attributes required to create a valid
  # Review. As you add validations to Review, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {
    review_positive_text: "This is valid positive comments text in the body" ,
    sus_score_placeholder: 0 ,
    csus_score_placeholder: 0 ,
    number_of_views: 9 ,
    likes: 8 ,
    dislikes: 1 ,
    review_negative_text: "This is valid negative comments text in the body" ,
    review_title: "This is a valid review title",
    star_rating: 4,
    csus_scores_attributes: {0: {reduces_the_risk_of_clinical_error: 4, support_is_hard_to_access: 4, improves_quality_clinical_care: 3, consultation_adversely_affected: 2, gives_me_key_information_needed: 3, total_csus_score: 16 } }
    sus_scores_attributes: {i_would_like_to_use_this_system_frequently: 4, the_system_is_unnecessarily_complex: 3, the_system_is_easy_to_use: 2, i_need_frequent_technical_support_to_use_this_system: 3, the_various_functions_in_this_system_are_well_integrated: 2, there_is_too_much_inconsistency_in_this_system: 1, most_people_would_learn_to_use_this_system_very_quickly: 3, the_system_was_very_cumbersome_to_use: 4, i_feel_confident_using_this_system: 4, i_needed_to_learn_a_lot_of_things_before_i_could_get_going_with: 5, total_sus_score: 29 }
    "sus_scores_attributes"=>{"0"=>{"i_would_like_to_use_this_system_frequently"=>"2", "the_system_is_unnecessarily_complex"=>"3", "the_system_is_easy_to_use"=>"1", "i_need_frequent_technical_support_to_use_this_system"=>"3", "the_various_functions_in_this_system_are_well_integrated"=>"1", "there_is_too_much_inconsistency_in_this_system"=>"3", "most_people_would_learn_to_use_this_system_very_quickly"=>"1", "the_system_was_very_cumbersome_to_use"=>"3", "i_feel_confident_using_this_system"=>"1", "i_needed_to_learn_a_lot_of_things_before_i_could_get_going_with"=>"3"}}
  } }

  let(:invalid_attributes) { {
    review_positive_text: 1 ,
    sus_score_placeholder: "text" ,
    csus_score_placeholder: "text" ,
    number_of_views: "text" ,
    likes: "text" ,
    dislikes: "text" ,
    review_negative_text: 0 ,
    review_title: 0,
    star_rating: 15
  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ReviewsController. Be sure to keep this updated too.

  # let(:valid_session) { {} }

  it "should have a current_user" do
    subject.current_user.should_not be_nil
  end

  describe "GET #index" do
    it "assigns all reviews as @reviews" do
      review = Review.create! valid_attributes
      get :index, {}
      expect(assigns(:reviews)).to eq([review])
    end
  end

  describe "GET #show" do
    it "assigns the requested review as @review" do
      review = Review.create! valid_attributes
      get :show, {:id => review.to_param}
      expect(assigns(:review)).to eq(review)
    end
  end

  describe "GET #new" do
    it "assigns a new review as @review" do
      get :new, {}
      expect(assigns(:review)).to be_a_new(Review)
    end
  end

  describe "GET #edit" do
    it "assigns the requested review as @review" do
      review = Review.create! valid_attributes
      get :edit, {:id => review.to_param}
      expect(assigns(:review)).to eq(review)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Review" do
        expect {
          post :create, {:review => valid_attributes}
        }.to change(Review, :count).by(1)
      end

      it "assigns a newly created review as @review" do
        post :create, {:review => valid_attributes}
        expect(assigns(:review)).to be_a(Review)
        expect(assigns(:review)).to be_persisted
      end

      it "redirects to the created review" do
        post :create, {:review => valid_attributes}
        expect(response).to redirect_to(Review.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved review as @review" do
        post :create, {:review => invalid_attributes}
        expect(assigns(:review)).to be_a_new(Review)
      end

      it "re-renders the 'new' template" do
        post :create, {:review => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { {
          review_title: "This is an updated yet valid review title",
          review_body: "This is an updated yet valid review text in the body",
          sus_score: 82.5,
          csus_score: 42.5,
          star_rating: 3
      } }

      it "updates the requested review" do
        review = Review.create! valid_attributes
        put :update, {:id => review.to_param, :review => new_attributes}
        review.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested review as @review" do
        review = Review.create! valid_attributes
        put :update, {:id => review.to_param, :review => valid_attributes}
        expect(assigns(:review)).to eq(review)
      end

      it "redirects to the review" do
        review = Review.create! valid_attributes
        put :update, {:id => review.to_param, :review => valid_attributes}
        expect(response).to redirect_to(review)
      end
    end

    context "with invalid params" do
      it "assigns the review as @review" do
        review = Review.create! valid_attributes
        put :update, {:id => review.to_param, :review => invalid_attributes}
        expect(assigns(:review)).to eq(review)
      end

      it "re-renders the 'edit' template" do
        review = Review.create! valid_attributes
        put :update, {:id => review.to_param, :review => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested review" do
      review = Review.create! valid_attributes
      expect {
        delete :destroy, {:id => review.to_param}
      }.to change(Review, :count).by(-1)
    end

    it "redirects to the reviews list" do
      review = Review.create! valid_attributes
      delete :destroy, {:id => review.to_param}
      expect(response).to redirect_to(reviews_url)
    end
  end

end
