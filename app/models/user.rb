class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :chances, dependent: :destroy
  has_many :crowdcards
  has_many :flags, dependent: :destroy
  has_many :state_users, dependent: :destroy
  has_many :states, through: :state_users
  has_many :supports
  has_many :user_wishes, dependent: :destroy
  has_many :wishes, through: :user_wishes
  has_one  :payment, dependent: :destroy

  validates_integrity_of  :avatar
  validates_processing_of :avatar
  validates :datenschutz, inclusion: [true]

  scope :byids, ->(ids) { where(['users.id IN (?)', ids.split(',')])}
  scope :confirmed, -> { where('confirmed_at is not null') }
  scope :frst_notification_not_sent, -> { includes(:payment).where(payments: { sent_first_notification_at: nil }) }
  scope :frst_notification_sent, -> { includes(:payment).where.not(payments: { sent_first_notification_at: nil }) }
  scope :has_code, -> { includes(:chances).where.not(chances: { code: nil })}
  scope :has_crowdcard, -> { joins(:crowdcards).distinct }
  scope :has_no_tandems, -> { where('users.id NOT IN (SELECT DISTINCT(inviter_id) FROM tandems where inviter_id is not null) AND users.id NOT IN (SELECT DISTINCT(invitee_id) FROM tandems where invitee_id is not null)') }
  scope :has_tandems, -> { where('users.id IN (SELECT DISTINCT(inviter_id) FROM tandems) OR users.id IN (SELECT DISTINCT(invitee_id) FROM tandems)') }
  scope :is_squirrel, -> { includes(:payment).where(payments: {active: true}) }
  scope :last_squirrel_id, ->(last_squirrel_id) { includes(:payment).where(payments: { id: 0..last_squirrel_id.to_i }) }
  scope :not_confirmed, -> { where('confirmed_at is null') }
  scope :not_participating, -> { where.not(id: Chance.where(chances: { confirmed: true }).select(:user_id).uniq) }
  scope :participating, -> { includes(:chances).where(chances: { confirmed: true })}
  scope :sign_up_after, ->(date) { where('created_at > ?',date)}
  scope :with_crowdbar, -> { includes(:flags).where(flags: {name: 'hasCrowdbar', value_boolean: true}) }
  scope :with_flag, ->(flag, value) { joins(:flags).where('flags.name = ? and flags.value_boolean = ?', flag, value)}
  scope :with_newsletter, -> { where(newsletter: true) }
  scope :without_crowdbar, -> { includes(:flags).where(flags: {name: 'hasCrowdbar', value_boolean: false}) }
  scope :without_newsletter, -> { where(newsletter: false) }

  searchable do
    text :name
    text :email
    text :id
  end

  def self.all_newsletter_recipients
  end

  def tandems
    Tandem.where("(inviter_id = #{id} or invitee_id = #{id}) and inviter_id != invitee_id and disabled_by is null")
  end

end
