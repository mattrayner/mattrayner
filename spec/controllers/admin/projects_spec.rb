require 'rails_helper'

describe Admin::ProjectsController do
  it_behaves_like 'an authenticated controller', 'index'

  describe 'with a logged in user' do
    before do
      sign_in create(:user)
    end

    describe '#index' do
      before do
        5.times { create(:project) }

        get :index
      end

      it 'populates @projects with the correct number of projects' do
        projects = controller.instance_variable_get(:@projects)
        expect(projects.size).to eq(5)
      end
    end
  end
end