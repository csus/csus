class SusScoresController < ApplicationController

  def new
  end

  def create
  end

  def sus_score_params
    params.require(:sus_score).permit(
      :id,
      :i_would_like_to_use_this_system_frequently,
      :the_system_is_unnecessarily_complex,
      :the_system_is_easy_to_use,
      :i_need_frequent_technical_support_to_use_this_system,
      :the_various_functions_in_this_system_are_well_integrated,
      :there_is_too_much_inconsistency_in_this_system,
      :most_people_would_learn_to_use_this_system_very_quickly,
      :the_system_was_very_cumbersome_to_use,
      :i_feel_confident_using_this_system,
      :i_needed_to_learn_a_lot_of_things_before_i_could_get_going_with,
      :total_sus_score
    )
  end
end
