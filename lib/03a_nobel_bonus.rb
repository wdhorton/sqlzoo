# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

# BONUS PROBLEM: requires sub-queries or joins. Attempt this after completing
# sections 04 and 07.

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
    SELECT
      physics.yr
    FROM
      (SELECT
        yr
      FROM
        nobels
      WHERE
        subject = 'Physics') as physics
    LEFT OUTER JOIN
      (SELECT
        yr
      FROM
        nobels
      WHERE
        subject = 'Chemistry') as chemistry
    ON
      physics.yr = chemistry.yr
    WHERE
      chemistry.yr IS NULL
    GROUP BY
      physics.yr
  SQL
end
