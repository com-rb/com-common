::RSpec.describe ::Com::AbstractMethodError do
  describe ".method_not_overridden_error" do
    let(:klass)       { SomeArbitraryClass }
    let(:method_name) { "do_important_job" }
    let(:expected_exception_message) do
      "Method 'do_important_job' has to be overridden in 'SomeArbitraryClass' class."
    end

    subject { described_class.method_not_overridden_error(klass, method_name) }

    before { class SomeArbitraryClass; end }
    after  { Object.instance_eval { remove_const(:SomeArbitraryClass) } }


    it { expect(subject).to be_instance_of(described_class)        }
    it { expect(subject).to be_kind_of(::Com::StandardError)       }
    it { expect(subject).to be_kind_of(StandardError)              }
    it { expect(subject.message).to eq(expected_exception_message) }
  end # .method_not_overridden_error
end
