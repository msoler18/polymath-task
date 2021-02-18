require 'rails_helper'

RSpec.describe Task, type: :model do
  context 'validation test' do

    it 'ensures task name presence' do
      task = Task.new(description: 'Description polymath task').save
      expect(task).to eq(false)
    end

    it 'ensures task description presence' do
      task = Task.new(name: 'Miguel').save
      expect(task).to eq(false)
    end

    it 'should save task successfully' do
      task = Task.new(name: 'Miguel', description: 'Description polymath task', due_date: '2021-02-18').save
      expect(task).to eq(true)
    end

  end
end
